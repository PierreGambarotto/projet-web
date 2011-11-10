class PostsController < ApplicationController
	def index
		@posts = Post.all
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
	end

	def new
		@post = Post.new
		render
	end

	def create
		@post = Post.create(params[:post])
		redirect_to posts_path
	end

end
