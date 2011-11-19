require 'spec_helper'

describe 'delete /post/:id' do

	before(:each) do
		@post = Post.create(:title => "Sujet 1", :body => "Corps 1")
	end
	
	it "affiche un lien pour supprimer un post" do
		visit posts_path
		page.should have_link('Delete' , :href => post_path(@post), :method => :delete)
	end

	it "supprime le post de la page" do
		visit posts_path
		within("tr", :text => @post.title) do
			click_link :Delete
		end
		page.should have_no_link('Delete' , :href => post_path(@post), :method => :delete)
	end

end
