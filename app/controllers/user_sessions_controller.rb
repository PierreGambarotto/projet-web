class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(:login => params[:login], :password => params[:password])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default posts_path
    else
      redirect_to '/500.html'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default posts_path
  end
end

