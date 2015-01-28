class ReportController < ApplicationController
	before_action :not_signedin?

  def index
    
  end
  def vsales
    
  end

  def vsaleschoice
    @tanggal_awal =  params[:posemails][:startdate]
    @tanggal_akhir =  params[:posemails][:enddate]
    @end_date =  params[:posemails][:startdate]
    a = params[:posemails][:top10]
    cond = params[:posemails][:cond]
    if params[:posemails][:enddate].empty?
      @start_date = params[:posemails][:startdate]
    else
      @start_date = params[:posemails][:enddate]
    end
    
    @vsbp = Vsale.collection.aggregate([
        {"$match" => {"DateIssued" => {"$gte" => Time.parse(@end_date.to_s), "$lt" =>  Time.parse(@start_date.to_s)}}},
        { "$group" => {
            "_id" => "$Category",
            "totalPrice" => { "$sum" => "$#{cond}" },
            "totalOrdered" => { "$sum" => "$QtyOrdered" }
        }},
        { "$sort" => { "totalPrice" => -1 } },
        {"$limit" => a.to_i}
    ])

    @end_date = @end_date.to_date.strftime("%d %b %Y")
    @start_date = @start_date.to_date.strftime("%d %b %Y")
    cond
    @kondisi = ""
    cond.split("").each do |m| 
      if m == "C"
        @kondisi << " "
      end
      if m != "l" 
        @kondisi << m 
      else
       @kondisi << "l " 
      end 
    end

    render 'vsales'
  end

  def vsales_product
    
  end

  def vsales_product_choice
   
    a = params[:posemails][:top10]

    if params[:posemails][:category].empty?
      @kategori = nil
    else
      @kategori = params[:posemails][:category]
    end
    cond = params[:posemails][:cond]

    @start_date = params[:posemails][:startdate]
    @end_date = params[:posemails][:enddate]

    if params[:posemails][:startdate].empty? and params[:posemails][:enddate].empty?
      @start_date = Date.today.strftime("%Y/%m/%d")
      @end_date = @start_date
    end

    if @kategori.nil?
      @kategori = "ALL Category"
      @vsbp = Vsale.collection.aggregate([
        {"$match" => {"DateIssued" => {"$gte" => Time.parse(@start_date.to_s), "$lt" =>  Time.parse(@end_date.to_s)}}},
        { "$group" => {
            "_id" => "$ShortDesc",
            "totalUsed" => { "$sum" => "$#{cond}" },
            "totalOrdered" => { "$sum" => "$QtyOrdered" }
        }},
        { "$sort" => { "totalUsed" => -1 } },
        {"$limit" => a.to_i}
    ])
    else
      @vsbp = Vsale.collection.aggregate([
        {"$match" => {"Category" => "#{@kategori}", "DateIssued" => {"$gte" => Time.parse("#{@start_date}"), "$lt" =>  Time.parse("#{@end_date}")}}},
        { "$group" => {
            "_id" => "$ShortDesc",
            "totalUsed" => { "$sum" => "$TotalPrice" },
            "totalOrdered" => { "$sum" => "$QtyOrdered" }
        }},
        { "$sort" => { "totalUsed" => -1 } },
        {"$limit" => a.to_i}
    ])
    end    

    

    @end_date = @end_date.to_date.strftime("%d %b %Y")
    @start_date = @start_date.to_date.strftime("%d %b %Y")
    cond
    @kondisi = ""
    cond.split("").each do |m| 
      if m == "C"
        @kondisi << " "
      end
      if m != "l" 
        @kondisi << m 
      else
       @kondisi << "l " 
      end 
    end
    render 'vsales_product'
  end

  def vsales_year
    @month = Vsale.collection.aggregate(
        {"$project" => {
             "year" => {"$year" => "$DateIssued"}, 
             "month" => {"$month" => "$DateIssued"},
             "totalprice" => "$TotalPrice"
        }},
        {"$group" => {
             "_id" => {"year" => "$year", "month" => "$month"}, 
             "count" => {"$sum" => "$totalprice"}
        }}
    )
  end

  def vsales_loc
     
  end

  def vsales_lochice
    
    @tanggal_awal =  params[:posemails][:startdate]
    @tanggal_akhir =  params[:posemails][:enddate]
    @end_date =  params[:posemails][:startdate]
    a = params[:posemails][:top10]

    if params[:posemails][:enddate].empty?
      @start_date = params[:posemails][:startdate]
    else
      @start_date = params[:posemails][:enddate]
    end
    cond = params[:posemails][:cond]
    @vsbloc = Vsale.collection.aggregate([
        {"$match" => {"DateIssued" => {"$gte" => Time.parse(@end_date.to_s), "$lt" =>  Time.parse(@start_date.to_s)}}},
        { "$group" => {
            "_id" => "$OrgName",
            "totalPrice" => { "$sum" => "$#{cond}" }
        }},
        { "$sort" => { "totalPrice" => -1 } },
        {"$limit" => a.to_i}
    ])

    @end_date = @end_date.to_date.strftime("%d %b %Y")
    @start_date = @start_date.to_date.strftime("%d %b %Y")
    cond
    @kondisi = ""
    cond.split("").each do |m| 
      if m == "C"
        @kondisi << " "
      end
      if m != "l" 
        @kondisi << m 
      else
       @kondisi << "l " 
      end 
    end

    render 'vsales_loc'
  end

  def posemail
  	  	
  end

  def posemailchoice
    @orgnama = params[:posemails][:orgnama]
      
    if params[:posemails][:enddate].empty?
      @start_date = params[:posemails][:startdate]
      @end_date = @start_date
    else
      @start_date = params[:posemails][:enddate]
    end

    if params[:posemails][:startdate].empty?
      @end_date = params[:posemails][:enddate]
      @start_date = @end_date
    else
      @end_date = params[:posemails][:startdate]
    end
    
    if (@end_date.empty? and @start_date.empty?)
      @data = Posemail.all.no_timeout.group_by(&:Status)
    elsif @orgnama.empty?
       @data = Posemail.only(:AsalOrg, :DateReceived, :Processed, :Status).where({:DateReceivedTemp=> {:$gte=> "#{@end_date}T00:00:00.000Z".to_date, :$lt=> (("#{@start_date}T00:00:00.000Z".to_date)+1)}}).no_timeout.batch_size(1000000).group_by(&:Status) 
    else
      @data = Posemail.only(:AsalOrg, :DateReceived, :Processed, :Status).where(AsalOrg: @orgnama).where({:DateReceivedTemp=> {:$gte=> "#{@end_date}T00:00:00.000Z".to_date, :$lt=> (("#{@start_date}T00:00:00.000Z".to_date)+1)}}).no_timeout.batch_size(1000000).group_by(&:Status)
      @end_date = @end_date.to_date.strftime("%d %b %Y")
      @start_date = @start_date.to_date.strftime("%d %b %Y")
    end
    
    render 'posemail'
  end
end
