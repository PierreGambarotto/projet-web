class UsersController < ApplicationController
	before_filter :require_user

  def new
		@user = User.new
		render
  end

  def create
		puts "PARAMS : " + params.inspect
		@user = User.new(:login => params[:login], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
		if @user.save
			flash[:notice] = 'User created sucessfully'
		else
			flash[:notice] = 'Error : user not created'
		end
		redirect_to posts_path
  end

end
