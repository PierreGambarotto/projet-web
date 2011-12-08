class PostsController < ApplicationController
	before_filter :require_user, :except => [:index, :show]

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
		puts "parametres passes a la methode create : " + params[:post].inspect
		@post = Post.create(params[:post])
		redirect_to posts_path
	end
	
	def show
		@post = Post.find(params[:id])
		render
	end

  def edit
    @post = Post.find(params[:id])
    render
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post), notice: 'Post was successfully updated.' # @post <=> post[@post.id]
    else
      render action: "edit"
    end
  end

	def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end
