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
		get post_path(@post.id)
		response.body.should include(@post.title)
		response.body.should include(@post.body)
	end

end
