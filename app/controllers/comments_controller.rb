class CommentsController < ApplicationController

	def new
		@post = Post.find(params[:id])
		respond_to do |format|
			format.js
			format.html
		end
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(:author => params[:comment_author], :body => params[:comment_body])
		respond_to do |format|
			format.js
			format.html { redirect_to post_path(@post) }
		end
	end
	
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end
