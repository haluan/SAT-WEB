class SessionsController < ApplicationController
  def new
	if signed_in?
		redirect_to root_path
	end
  end
  def create
  	sql = "SELECT 1+2 from dual"
  	begin
  		clients = TinyTds::Client.new(:username => params[:sessions][:sa], :password => params[:sessions][:pass], :host => '192.168.1.119', :port => '1433', :database => 'SAT_NEW', timeout: 9999990)
		@data = clients.execute(sql)
		sign_in(params[:sessions][:sa], params[:sessions][:pass])
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
