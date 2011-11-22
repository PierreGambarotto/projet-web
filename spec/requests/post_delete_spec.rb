require 'spec_helper'

describe 'delete /post/:id' do
		pending "Redirection apres clic sur un lien Delete"
	before(:each) do
		@post = Post.create(:title => "Sujet 1", :body => "Corps 1")
		
	end

#	it "supprime un post" do
#		visit posts_path
#		page.should have_link('Delete' , :href => post_path(@post), :method => :delete)
#		within("tr", :text => @post.body)  do
#			click_on :Delete
#		end
#		current_path.should == posts_path
#		page.should_not have_content(@post.body)
	end

end
