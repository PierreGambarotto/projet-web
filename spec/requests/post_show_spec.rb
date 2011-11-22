require 'spec_helper'

describe "post_show" do

	before(:each) do
		@post = Post.create(:title => "subject1", :body => "bla bla1");
	end
	  
	it "affiche un lien pour afficher un post" do
		visit posts_path
		page.should have_link('Show' , :href => post_path(@post.id))
	end

	it "affiche le contenu du post" do
		visit posts_path
		within("tr", :text => @post.body) do
			click_on :Show
		end
		current_path.should == post_path(@post)
		page.should have_content(@post.title)
		page.should have_content(@post.body)
	end

end

