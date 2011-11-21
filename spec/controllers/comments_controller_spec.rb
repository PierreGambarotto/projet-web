require 'spec_helper'

describe CommentsController do
		pending "Tous les tests controleur"
#		before(:each) do
#			@post = stub_model(Post, :title => "Titre 1", :body => "Corps 1")
#			@post.stub(:find) {@post}
#			@comment = stub_model(Comment, :author => "Sylvain", "body" => "Com", :post_id => @post.id)
#			comments = double("comments")
#			@post.stub(:comments) { comments }
#			comments.stub(:create) {true}
#			comments.stub(:find) { @comment }
#			comments.stub(:destroy) {true}
#		end

#	describe 'POST /posts/:id/comments' do

#		it 'cree un commentaire' do
#			Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
#			@post.comments.should_receive(:create).with(:author => @comment.author, :body => @comment.body).and_return(true)
#			post :create, {:id => @post.id, :post => @post, "comment_author" => :Sylvain, "comment_body" => "Com"}
#			response.should redirect_to(@post)
#		end
#	end

#	describe 'DELETE comment' do
#		before(:each) do
#			@post.comments.create(@comment)
#		end
#		it 'supprime un commentaire' do
#			Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
#			@post.comments.should_receive(:create).with(:author => @comment.author, :body => @comment.body).and_return(@comment)
#			@post.comments.should_receive(:find).with(@comment.id)
#			delete :destroy, :post_id => @post.id, :id => comments
#		end
#	
#	end
end

