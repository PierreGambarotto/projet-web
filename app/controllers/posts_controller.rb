class PostsController < ApplicationController
	before_filter :require_user, :except => [:index, :show, :search, :find]

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

	def search
		render
	end

	def find
		titre = params[:search_title]
		corps = params[:search_body]
		
		if titre.empty? 
			if corps.empty?
				@posts = Post.all
			else 
				#recherche seulement dans le corps des posts
				@posts = Post.find(:all, :conditions => ['body LIKE ?', '%' + corps + '%' ] )
				puts "ICI : " + @posts.find.inspect
			end
		else	#recherche dans le titre
				if corps.empty?
					#recherche seulement dans le titre
					@posts = Post.find(:all,:conditions => ['title LIKE ?', '%' + titre + '%' ] )
				else 
					#recherche dans le titre et le corps
					@posts = Post.find(:all, :conditions => ['title LIKE ?', '%' + titre + '%' ], :conditions => ['body LIKE ?', '%' + corps + '%' ] )
				end
		end
		render 'index'
	end
end
