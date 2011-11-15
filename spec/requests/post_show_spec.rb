require 'spec_helper'

describe "post_show" do

	before(:each) do
		@post1 = Post.create(:title => "subject1", :body => "bla bla1");
		@post2 = Post.create(:title => "subject2", :body => "bla bla2");
	end

	describe "GET /post/:id" do
		it "affiche le contenu du post" do
			get "/posts/#{@post1.id}"
			response.body.should include(@post1.title)
			response.body.should include(@post1.body)
		end
	end


end
