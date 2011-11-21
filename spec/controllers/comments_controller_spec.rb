require 'spec_helper'

describe CommentsController do

	describe 'POST /posts/:id/comments' do
		before(:each) do
			@post = stub_model(Post, :title => "Titre 1", :body => "Corps 1")
			@post.stub(:find) {@post}
			@comment = stub_model(Comment, :author => "Sylvain", "body" => "Com", :post_id => @post.id)
			comments = double("comments")
			@post.stub(:comments) { comments }
			comments.stub(:create) {true}
		end

		it 'cree un commentaire' do
			Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
			@post.comments.should_receive(:create).with(:author => @comment.author, :body => @comment.body).and_return(true)
			post :create, {:id => @post.id, :post => @post, "comment_author" => :Sylvain, "comment_body" => "Com"}
			response.should redirect_to(@post)
		end
	end
end

