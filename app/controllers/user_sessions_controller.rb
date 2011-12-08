class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
		respond_to do |format|
			format.js
			format.html
		end
  end

  def create
		@user_session = UserSession.new(:login => params[:login], :password => params[:password])
		if @user_session.save
			flash[:notice] = "Login successful!"
			respond_to do |format|
				format.js
				format.html {redirect_to '/'}
			end
		else
			flash[:notice] = "Login error!"
			respond_to do |format|
				format.js {render 'login_error.js.erb'}
				format.html {redirect_to '/login'}
			end
		end

  end

  def destroy
    current_user_session.destroy
		flash[:notice] = "Logout successful!"
		respond_to do |format|
			format.js
			format.html {redirect_to :back}
		end
  end
end

