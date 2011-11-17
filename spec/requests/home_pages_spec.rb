require 'spec_helper'

describe "HomePages" do

	before(:each) do
		@post1 = Post.create(:title => "subject1", :body => "bla bla");
		@post2 = Post.create(:title => "subject2", :body => "bla bla");
	end

  it "generates a listing of posts" do
		get posts_path
		response.body.should include(@post1.title)
		response.body.should include(@post2.title)
  end

end
