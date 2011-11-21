require 'spec_helper'

describe PostsController do

  describe "GET 'index'" do
    before(:each) do
      @posts = [stub_model(Post,:title => "1"), stub_model(Post, :title => "2")]
      Post.stub(:all){ @posts }
    end
    it "assigns a list of posts" do
      Post.should_receive(:all).and_return(@posts) #specifie les methodes qui devront etre appelees lors du test
      get 'index'
      assigns(:posts).should eq @posts            #verifier que les variables ont la bonne valeur
      response.should be_success
    end

    it "renders the template list" do
      get 'index'
      response.should render_template(:index)
    end
  end

	describe "GET show " do
		before(:each) do
      @post = stub_model(Post,:title => "titre", :body => "corps")
      Post.stub(:all){ @post }
    end

		it "affiche un post" do
			Post.should_receive(:find).with("1").and_return(@post)
			get :show, :id => "1"
			assigns(:post).should eq @post
		end
		
	end

	describe "POST /posts" do

    it "cree un nouveau post" do 
			post :create, :post => {:title => "t1", :body => "b1"}
			assigns(:post).should be_a(Post)
		end

    it "redirection" do
      post :create, :post => {:title => "t1", :body => "b1"}
      response.should redirect_to(posts_path)
    end
		
	end

  describe "PUT update" do
    before(:each) do
      @post = stub_model(Post,:title => "1")
      Post.stub(:all){ @post }
    end

    it "edite" do
      Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
      put :update, {:id => @post.id, :title => "new title"}
      response.should redirect_to(post_path(@post))
    end
 
	end

	describe "DELETE post/:id" do
		before(:each) do
			@post = stub_model(Post, :title => "Titre 1", :body => "Corps 1")
			@post.stub(:find) {@post}
			@post.stub(:destroy){ true }
		end

		it "supprime un post" do
			Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
			@post.should_receive(:destroy)
			delete :destroy, :id => @post.id
			response.should redirect_to(posts_path)
		end

	end

	

	
end























