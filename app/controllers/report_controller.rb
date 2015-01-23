class ReportController < ApplicationController
	before_action :not_signedin?
  def vsales
    
  end

  def vsaleschoice
    @tanggal_awal =  params[:posemails][:startdate]
    @tanggal_akhir =  params[:posemails][:enddate]
    @end_date =  params[:posemails][:startdate]

    if params[:posemails][:enddate].empty?
      @start_date = params[:posemails][:startdate]
    else
      @start_date = params[:posemails][:enddate]
    end
    
    @vsbp = Vsale.only(:QtyUsed, :QtyOrdered, :Category, :DateIssued).no_timeout.batch_size(100000).where({:DateIssued=> {:$gte=> "#{@end_date}T00:00:00.000Z".to_date, :$lt=> (("#{@start_date}T00:00:00.000Z".to_date)+1)}}).group_by(&:Category)
    

    @end_date = @end_date.to_date.strftime("%d %b %Y")
    @start_date = @start_date.to_date.strftime("%d %b %Y")

    render 'vsales'
  end

  def vsales_product
    a = "50" 
    @jambu = Vsale.collection.aggregate([
        {"$match" => {"Category" => "Mika", "DateIssued" => {"$gte" => Time.parse('2013/01/01'), "$lt" =>  Time.parse('2014/01/20')}}},
        { "$group" => {
            "_id" => "$ShortDesc",
            "total" => { "$sum" => "$QtyUsed" }
        }},
        { "$sort" => { "total" => -1 } },
        {"$limit" => a.to_i}
    ])
  end

  def vsales_product_choice
    @tanggal_awal =  params[:posemails][:startdate]
    @tanggal_akhir =  params[:posemails][:enddate]
    @end_date =  params[:posemails][:startdate]

    if params[:posemails][:category].empty?
      @kategori = nil
    else
      @kategori = params[:posemails][:category]
    end

    if params[:posemails][:enddate].empty?
      @start_date = params[:posemails][:startdate]
    else
      @start_date = params[:posemails][:enddate]
    end

    if params[:posemails][:startdate].empty? and params[:posemails][:enddate].empty?
      @start_date = Date.today.strftime("%Y/%m/%d")
      @end_date = @start_date
    end

    if @kategori.nil?
      @kategori = "ALL Category"
      @vsbp = Vsale.only(:QtyUsed, :QtyOrdered, :ShortDesc ,:Category, :DateIssued).no_timeout.batch_size(100000).where({:DateIssued=> {:$gte=> "#{@end_date}T00:00:00.000Z".to_date, :$lt=> (("#{@start_date}T00:00:00.000Z".to_date)+1)}}).group_by(&:ShortDesc)
    else
      @vsbp = Vsale.only(:QtyUsed, :QtyOrdered, :ShortDesc ,:Category, :DateIssued).no_timeout.batch_size(100000).where(Category: @kategori ).where({:DateIssued=> {:$gte=> "#{@end_date}T00:00:00.000Z".to_date, :$lt=> (("#{@start_date}T00:00:00.000Z".to_date)+1)}}).group_by(&:ShortDesc)
    end    

    

    @end_date = @end_date.to_date.strftime("%d %b %Y")
    @start_date = @start_date.to_date.strftime("%d %b %Y")
    render 'vsales_product'
  end

  def vsales_year
    @month = Vsale.group_by('DateIssued', 'month')
  end

  def vsales_loc
    
  end

  def vsales_lochice
    
    @tanggal_awal =  params[:posemails][:startdate]
    @tanggal_akhir =  params[:posemails][:enddate]
    @end_date =  params[:posemails][:startdate]

    if params[:posemails][:enddate].empty?
      @start_date = params[:posemails][:startdate]
    else
      @start_date = params[:posemails][:enddate]
    end

    @vsbloc = Vsale.only(:id, :QtyUsed, :QtyOrdered, :DateIssued, :OrgName).no_timeout.batch_size(1000000).where({:DateIssued=> {:$gte=> "#{@end_date}T00:00:00.000Z".to_date, :$lt=> (("#{@start_date}T00:00:00.000Z".to_date)+1)}}).group_by(&:OrgName)

    @end_date = @end_date.to_date.strftime("%d %b %Y")
    @start_date = @start_date.to_date.strftime("%d %b %Y")

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
    
    if @end_date.empty? and @start_date.empty?
      @data = Posemail.all.no_timeout.group_by(&:Status)
    else
      @data = Posemail.only(:AsalOrg, :DateReceived, :Processed, :Status).where(AsalOrg: @orgnama).where({:DateReceivedTemp=> {:$gte=> "#{@end_date}T00:00:00.000Z".to_date, :$lt=> (("#{@start_date}T00:00:00.000Z".to_date)+1)}}).no_timeout.batch_size(1000000).group_by(&:Status)
      @end_date = @end_date.to_date.strftime("%d %b %Y")
      @start_date = @start_date.to_date.strftime("%d %b %Y")
    end
    
    render 'posemail'
  end
end
