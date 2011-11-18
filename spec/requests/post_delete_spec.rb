require 'spec_helper'

describe 'delete /post/:id' do

	before(:each) do
		@posts = [Post.create(:title => "Sujet 1", :body => "Sujet 1"),
							Post.create(:title => "Sujet 2", :body => "Sujet 2")]
	end
	
	it "affiche un lien pour supprimer un post" do
		visit posts_path
		@posts.each {|post| page.should have_link('Delete' , :href => post_path(post), :method => :delete)}
	end

	it "supprime le post 2, il ne reste plus que le post 1" do
		visit posts_path
		within("tr td", :text => @posts[2].title) do
			click_link :Delete
		end
		page.should_not have_content(@posts[2].body)
	end

end
