class UsersController < ApplicationController
  def new
  	@user =  User.new
  end

  def create
  	pass = Digest::SHA2.hexdigest(params[:reg_form][:pass])
  	@user =  User.new(:name => params[:reg_form][:login],:pass => pass)
  	if @user.save
  		redirect_to :controller => "rubricator", :action => :index
  	else
  		render "new"
  	end
  end


  def signin
  	user = User.find_by_name(params[:log_form][:login])
  	if !(user.nil?)
	  	if user.pass == Digest::SHA2.hexdigest(params[:log_form][:pass])
	  		session[:user] = user.name
	  		session[:pass] = user.pass
			redirect_to :controller => "rubricator", :action => :index
		else
			@pas = true
			render "error"
		end
	else
		@pas = false
		render "error"
	end
  end

  def error
  end

  def signout
	session[:user] = nil
	session[:pass] = nil
	redirect_to :controller => "rubricator", :action => :index
  end


end
