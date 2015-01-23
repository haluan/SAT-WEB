class Vsale
	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Attributes::Dynamic

	field :OrgID
	field :OrgCode
	field :OrgName
	field :OrderNo
	field :DateIssued
	field :DateIssuedTemp, type: Date
	field :ProductID
	field :KeyName
	field :ShortDesc
	field :BrandID
	field :BrandName
	field :CategoryID
	field :CategoryCode
	field :Category
	field :ProductStatusID
	field :ProductStatusCode
	field :ProductStatus
	field :PromoID
	field :PromoCode
	field :PromoDesc
	field :LocationID
	field :LocationCode
	field :Description
	field :QtyOrdered, type: Integer
	field :QtyUsed, type: Integer
	field :UnitPrice, type: Float
	field :TotalDiscount, type: Float
	field :TaxPrice, type: Float
	field :PriceBeforeTax, type: Float
	field :TotalPrice, type: Float
	field :UnitPriceCOGS, type: Float
	field :TotalDiscountCOGS, type: Float
	field :TaxPriceCOGS, type: Float
	field :PriceBeforeTaxCOGS, type: Float
	field :TotalPriceCOGS, type: Float

	index({ id: 1 }, { unique: true })


	def self.group_by(field, format = 'day')
	    key_op = [['year', '$year'], ['month', '$month'], ['day', '$dayOfMonth']]
	    key_op = key_op.take(1 + key_op.find_index { |key, op| format == key })
	    project_date_fields = Hash[*key_op.collect { |key, op| [key, {op => "$#{field}"}] }.flatten]
	    group_id_fields = Hash[*key_op.collect { |key, op| [key, "$#{key}"] }.flatten]
	    pipeline = [
	        {"$project" => {"name" => 1, field => 1}.merge(project_date_fields)},
	        {"$group" => {"_id" => group_id_fields, "count" => {"$sum" => 1}}},
	        {"$sort" => {"_id" => -1}}
	    ]
	    collection.aggregate(pipeline)
  	end

  	def self.bp_out
  		pipeline = [
    		{"$match" => {"Category" => "'Mika'", "DateIssued" => {"$gte" => "ISODate('2013-01-01T00:00:00.0Z')", "$lt" => "ISODate('2013-02-01T00:00:00.0Z')"}}},
		   {
		       "$group" => {"_id" => "$ShortDesc", "total" => { "$sum" => "$QtyUsed" }, }
		   }
  		]

  		collection.aggregate(pipeline)
  	end

  	def self.jambu
  		map = %Q{
		  function() {
		    emit(this.ShortDesc, { QtyOrdered: this.QtyOrdered.to_i });
		  }
		}

		reduce = %Q{
		  function(key, values) {
		    var result = { QtyOrdered: 0 };
		    values.forEach(function(value) {
		      result.QtyOrdered += value.QtyOrdered;
		    });
		    return result;
		  }
		}
  		self.no_timeout.where({:DateIssued=> {:$gte=> "2014/01/01T00:00:00.000Z".to_date, :$lt=> (("2014/01/02T00:00:00.000Z".to_date)+1)}}).map_reduce(map, reduce).out(replace: "QtyOrdered")
  	end

end
