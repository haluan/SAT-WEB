class SessionsController < ApplicationController
  def new
	if signed_in?
		redirect_to root_path
	end
  end
  def create
  	sql = "SELECT 1+2 from dual"
  	begin
    nama = params[:sessions][:username]
  	clients = TinyTds::Client.new(:username => params[:sessions][:username], :password => params[:sessions][:pass], :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW', timeout: 9999990)
		@data = clients.execute(sql)
		sign_in(params[:sessions][:username], params[:sessions][:pass])
    @is_admin = 0
    clients1 = TinyTds::Client.new(:username => "sa", :password => "z", :host => 'HALUAN-ISJ', :port => '1433', :database => 'SAT_NEW', timeout: 9999990)
    @status = clients1.execute("EXEC sp_helpsrvrolemember 'sysadmin'")
    nama = nama.split(params[:sessions][:pass]).first
    @status.each do |m| 
      if m["MemberName"] == "#{nama.to_s}" 
        @is_admin = 1 
      end
    end 
    cookies.permanent[:admin] = @is_admin
    redirect_to root_path
	rescue
		@data = nil
		redirect_to signin_path
	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
