require 'spec_helper'

describe 'delete /post/:id' do
		pending "Redirection apres clic sur un lien Delete"
	before(:all) do
		@post = Post.create(:title => "Sujet 1", :body => "Corps 1")
		
	end

#	it "affiche le bouton de suppression" do
#		visit posts_path
#		page.should have_link('Delete' , :href => post_path(@post), :method => :delete)		
#		click_link :Delete
#		current_path.should == posts_path
#		page.should_not have_content(@post.body)
#	end

end
