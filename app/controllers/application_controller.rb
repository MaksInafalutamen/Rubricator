class ApplicationController < ActionController::Base
  protect_from_forgery


  def user_type
  	if session[:user].nil?
  		return "guest"
  	elsif User.find_by_name(session[:user]).pass == session[:pass]
  		if session[:user] == 'Admin'
  			return "admin"
  		else
  			return "user"
  		end
  	else
  		return "error"
  	end
  end
  		
end
