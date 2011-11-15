require 'spec_helper'

describe PostsController do

  describe "GET 'index'" do
    before(:each) do
      @posts = [stub_model(Post,:title => "1"), stub_model(Post, :title => "2")]
      Post.stub(:all){ @posts }
    end
    it "assigns a list of posts" do
      Post.should_receive(:all).and_return(@posts)
      get 'index'
      assigns(:posts).should eq @posts
      response.should be_success
    end

    it "renders the template list" do
      get 'index'
      response.should render_template(:index)
    end
  end

	describe "GET show " do
		before(:each) do
      @posts = [stub_model(Post,:title => "1"),stub_model(Post,:title => "2")]
      Post.stub(:all){ @posts }
    end

		it "affiche un post" do
			Post.should_receive(:find).with("1").and_return(@posts[1])
			get :show, :id => "1"
			assigns(:post).should eq @posts[1]
		end
		
	end

	describe "creation d\'un nouveau post" do

		it "creates a new post" do 
			post :create, :post => {:title => "t1", :body => "b1"}
			assigns(:post).should be_a(Post)
		end

    it "redirection" do
      post :create, :post => {:title => "t1", :body => "b1"}
      response.should redirect_to(posts_path)
    end
		
	end
	
end
