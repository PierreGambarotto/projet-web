require 'spec_helper'

describe CommentsController do
		before(:each) do
			@post = Post.create(:title => "Titre 1", :body => "Corps 1")
			comments = double("Comment")

			@post.stub(:find) {@post}

			@post.comments.stub(:create) {true}
			@post.comments.stub(:destroy) {true}
		end
		after(:each) do
			Post.destroy(@post.id)
		end

	describe 'POST /posts/:id/comments' do

		it 'cree un commentaire' do
			Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
			post :create, {"post_id" => @post.id, "comment_author" => "Sylvain", "comment_body" => "Com"}
			response.should redirect_to(@post)
			assigns(:comment).should be_a(Comment)
			assigns(:comment).should eq @post.comments[0]
		end
	end

	describe 'DELETE comment' do
		before(:each) do
			@comment = @post.comments.create(:author => "Sylvain", :body => "Com")
		end
		it 'supprime un commentaire' do
			delete :destroy, {:post_id => @post.id, :id => @comment.id}
			assigns(:comment).should be_nil
		end
	
	end
end

