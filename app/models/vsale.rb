class Vsale
	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::MapReduce
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
	field :QtyOrdered
	field :QtyUsed
	field :UnitPrice
	field :TotalDiscount
	field :TaxPrice
	field :PriceBeforeTax
	field :TotalPrice
	field :UnitPriceCOGS
	field :TotalDiscountCOGS
	field :TaxPriceCOGS
	field :PriceBeforeTaxCOGS
	field :TotalPriceCOGS


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
end
