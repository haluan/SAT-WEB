class GeneratorController < ApplicationController

  def index
  	# POSEMAIL

  	@dateLast_db = "SELECT TOP 1 CAST (DateReceived as Date) FROM dbo.tPOSReceive rec order by DateReceived desc;"
	clients2 = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW')
	date = clients2.execute(@dateLast_db)
	@date_last_db = date.first[""].to_s
	
	if Posemail.first.nil?
		a=0
	else
		@date_last_mongo = Posemail.all.no_timeout.batch_size(10000).order("DateReceived desc").first.DateReceived 
	end
		
	@status = (@date_last_db == @date_last_mongo.to_s)

	#VSALES
	@VdateLast_db = "SELECT TOP 1 CAST (DateIssued as Date) FROM vSAles rec order by DateIssued desc;"
	clients3 = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW', timeout: 999)
	
	dateRed = clients3.execute(@VdateLast_db)

	@Vdate_last_db = dateRed.first[""].to_s
	
	if Vsale.first.nil?
		a=0
	else
		@Vdate_last_mongo = Vsale.all.no_timeout.batch_size(10000).order("DateIssued desc").first.DateIssued 
	end

	@Vstatus = (@Vdate_last_mongo.to_date.strftime("%d %b %Y") == @Vdate_last_db.to_date.strftime("%d %b %Y")) if @Vdate_last_mongo != nil
  	
  end

  def category
  	Category.all.map{|m| m.destroy! }
  	Vsale.only(:Category).no_timeout.group_by(&:Category).map{|m, k| Category.create(name: m)}
  	# Organisasi.all.map{|m| m.destroy! }
  	# Posemail.only(:AsalOrg).no_timeout.group_by(&:AsalOrg).map{|m,k| Organisasi.create(name: m) }
  	redirect_to root_path
  end


  def posemail

  	@dateLast_db = "SELECT TOP 1 CAST (DateReceived as Date) FROM dbo.tPOSReceive rec order by DateReceived desc;"
	clients2 = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW')
	date = clients2.execute(@dateLast_db)
	@date_last_db = date.first[""].to_s

  	if Posemail.all.empty?
  		@last_date = nil
  	else
  		@last_date = Posemail.all.no_timeout.order("DateReceived desc").first.DateReceived
  		@untiles = @date_last_db
  	end

  	if @last_date.nil?
  		@sql_all = "SELECT count(subject) FROM dbo.tPOSReceive rec where CAST(rec.DateReceived as Date) < '2013-08-20' ;"
  	else
  		@sql_all = "SELECT count(subject) FROM dbo.tPOSReceive rec where CAST(rec.DateReceived as Date) > '#{@last_date}';"
  	end

  	
  	clients1 = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW')
	sum = clients1.execute(@sql_all)
	@long = sum.first[""].to_i
	
	sleep(1.seconds)
	
	@status = "Everything up to date"

	if Posemail.all.empty? or @date_last_db != Posemail.all.no_timeout.order("DateReceived desc").first.DateReceived
	  	page = 1
	 	range = 50000
	 	bawah = 0
	 	atas = 0
	 	counterPart = 0
	 	while true do
	 		atas = ((page*range)-range)+1
	 		bawah = page * range

	  		@sql = "WITH EmailData AS (SELECT ROW_NUMBER() OVER (ORDER BY a.POSReceiveID) AS RowNum, "+
	  		"a.Subject 'Subject', CAST(a.DateReceived as Date) 'DateReceived', "+
			"a.Status 'Satus',b.OrgCode 'AsalOrgCode',b.OrgName 'AsalOrg', c.OrgCode 'KeOrgCode',c.OrgName 'KeOrganisasi', "+
			"a.Processed 'Processed', a.ProcessMessage 'ProcessMessage' FROM (SELECT subject, POSReceiveID,rec.DateReceived, rec.ProcessMessage, "+
			"'Status' = "+
			"(case "+
				"when PARSENAME(REPLACE(rec.Subject,'_','.'),3) = 'PC' then "+
				"'Pos Cash' "+
				"when PARSENAME(REPLACE(rec.Subject,'_','.'),3) = 'PCC' then "+
				"'Pos Credit Card' "+
				"when PARSENAME(REPLACE(rec.Subject,'_','.'),3) = 'SR' then "+
				"'Sales return' "+
				"when SUBSTRING(rec.Subject,0,3) = 'SO' then "+
				"'Stock Opname' "+
				"when SUBSTRING(rec.Subject,0,3) = 'BM' then "+
				"'Branch Movement' "+ 	
			"END), "+
			"'INDEKS'= "+
			"(case "+
				"when PARSENAME(REPLACE(rec.Subject,'_','.'),3) = 'PC' then '3' "+
				"when PARSENAME(REPLACE(rec.Subject,'_','.'),3) = 'PCC' then	'4' "+
				"when PARSENAME(REPLACE(rec.Subject,'_','.'),3) = 'SR' then	'5' "+
				"when SUBSTRING(rec.Subject,0,3) = 'SO' then	'1' "+
				"when SUBSTRING(rec.Subject,0,3) = 'BM' then	'2' END) "+


			",'AsalOrganisai'= (case	when PARSENAME(REPLACE(rec.Subject,'_','.'),2) is NULL then "+
				"SUBSTRING(rec.Subject,4,9)	else 	PARSENAME(REPLACE(rec.Subject,'_','.'),2) END), "+
			"'KeOrganisai'= SUBSTRING(rec.Subject,14,9) ,rec.Processed FROM dbo.tPOSReceive rec, tOrg o "+

			"where o.OrgID = rec.OrgID) a LEFT JOIN tOrg b "+
			" ON a.[AsalOrganisai]=b.OrgCode LEFT JOIN  tOrg c "+
			 "on a.[KeOrganisai] = c.OrgCode) "+
			 "SELECT * FROM EmailData WHERE RowNum BETWEEN #{atas} AND #{bawah}"

			 if @last_date and @untiles
			 	@sql += "and CAST (EmailData.DateReceived as DATE) > '#{@last_date}'"
			 else
			 	@sql += "and CAST (EmailData.DateReceived as DATE) < '2013-08-20'"
			 end
	  
			clients = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW', timeout: 9999990)
			@data = clients.execute(@sql)
				@data.each do |data|
					posemail = Posemail.new 
					posemail.Subject = data["Subject"]
					posemail.DateReceived = data["DateReceived"]
					posemail.Status = data["Satus"]
					posemail.AsalOrg = data["AsalOrg"]
					posemail.KeOrgCode = data["KeOrgCode"]
					posemail.KeOrganisasi = data["KeOrganisasi"]
					posemail.Processed = data["Processed"]
					posemail.ProcessMessage = data["ProcessMessage"]
					posemail.DateReceivedTemp = posemail.DateReceived
					posemail.save
					counterPart +=1
					if counterPart == @long
						break
					end
				end

			if counterPart == @long
				break
			end
			page+=1
			sleep(1.seconds) 	
	 	end  	
	 	@status = "Completed"
 	end	
  end

  def vsales
  	
  	@dateLast_db = "select TOP 1 * from vSales order by DateIssued desc;"
	clients2 = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW', timeout: 9999990)
	date = clients2.execute(@dateLast_db)
	@date_last_db = date.first[""].to_s

  	if Vsale.all.empty?
  		@last_date = nil
  	else
  		@last_date = Vsale.all.order("DateIssued desc").first.DateIssued
  		@last_date = @last_date.to_date.strftime("%F")
  		@untiles = @date_last_db
  	end

  	if @last_date.nil?
  		@sql_all = "select count(*) FROM vSales v where CAST (DateIssued as Date) < '2013-12-31';"
  	else
  		@sql_all = "select count(*) FROM vSales v where CAST (DateIssued as Date) > '#{@last_date}';"
  	end

  	clients1 = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW', timeout: 9999990)
	sum = clients1.execute(@sql_all)
	@long = sum.first[""].to_i
	
	sleep(1.seconds)
	
	@status = "Everything up to date"

	if Vsale.all.empty? or @date_last_db != Vsale.all.order("DateIssued desc").first.DateIssued
		page = 1
	 	range = 10000
	 	bawah = 0
	 	atas = 0
	 	counterPart = 0
	 	while true do
	 		atas = ((page*range)-range)+1
	 		bawah = page * range

	 		if @last_date and @untiles
				@temp = " FROM vSales v where CAST (DateIssued as Date) > '#{@last_date}' ) "
			else
				@temp = " FROM vSales v where CAST (DateIssued as Date) < '2013-12-31' ) "
			end

	 		sql = "	WITH PENJUALAN as ( SELECT    ROW_NUMBER() OVER ( ORDER BY v.DateIssued ) AS RowNum, * "+
	 				@temp+
	 				" SELECT * from PENJUALAN WHERE   RowNum BETWEEN #{atas} AND #{bawah}  ORDER BY DateIssued asc"
			
			clients = TinyTds::Client.new(:username => 'sa', :password => 'Isjs3cr3t', :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW', timeout: 9999990)
			@data = clients.execute(sql) 
			@data.each do |data|
					vsale = Vsale.new
					vsale.OrgID = data["OrgID"]
					vsale.OrgCode = data["OrgCode"]
					vsale.OrgName = data["OrgName"]
					vsale.OrderNo = data["OrderNo"]
					vsale.DateIssued = data["DateIssued"]
					vsale.ProductID = data["ProductID"]
					vsale.KeyName = data["KeyName"]
					vsale.ShortDesc =  data["ShortDesc"]
					vsale.BrandID = data["BrandID"]
					vsale.BrandName = data["BrandName"]
					vsale.CategoryID = data["CategoryID"]
					vsale.CategoryCode = data["CategoryCode"]
					vsale.Category = data["Category"]
					vsale.ProductStatusID = data["ProductStatusID"]
					vsale.ProductStatusCode = data["ProductStatusCode"]
					vsale.ProductStatus = data["ProductStatus"]
					vsale.PromoID = data["PromoID"]
					vsale.PromoCode = data["PromoCode"]
					vsale.PromoDesc = data["PromoDesc"]
					vsale.LocationID = data["LocationID"]
					vsale.LocationCode = data["LocationCode"]
					vsale.Description = data["Description"]
					vsale.QtyOrdered = data["QtyOrdered"]
					vsale.QtyUsed = data["QtyUsed"]
					vsale.UnitPrice = data["UnitPrice"]
					vsale.TotalDiscount = data["TotalDiscount"]
					vsale.TaxPrice = data["TaxPrice"]
					vsale.PriceBeforeTax = data["PriceBeforeTax"]
					vsale.TotalPrice = data["TotalPrice"]
					vsale.UnitPriceCOGS = data["UnitPriceCOGS"]
					vsale.TotalDiscountCOGS = data["TotalDiscountCOGS"]
					vsale.TaxPriceCOGS = data["TaxPriceCOGS"]
					vsale.PriceBeforeTaxCOGS = data["PriceBeforeTaxCOGS"]
					vsale.TotalPriceCOGS = data["TotalPriceCOGS"]
					vsale.save
					counterPart += 1
					if counterPart == @long
						break
					end
			end
			if counterPart == @long
				break
			end
			page+=1
			sleep(1.seconds) 		
	 	end
	end	
 end
end
