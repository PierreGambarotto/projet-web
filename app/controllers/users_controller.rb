class UsersController < ApplicationController
  def new
		render
  end

  def create
		@user = User.create(params[:user])
		redirect_to '/'
  end

end
