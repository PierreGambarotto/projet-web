class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:id],)
		@comment = @post.comments.create(:author => params[:comment_author], :body => params[:comment_body])
		redirect_to post_path(@post)
	end
end
