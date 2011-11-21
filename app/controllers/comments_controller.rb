class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id],)
		@comment = @post.comments.create(:author => params[:comment_author], :body => params[:comment_body])
		redirect_to post_path(@post)
	end
	
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end
