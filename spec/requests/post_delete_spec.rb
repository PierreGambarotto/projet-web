require 'spec_helper'

describe 'delete /post/:id' do

	before(:each) do
		@post = Post.create(:title => "Sujet 1", :body => "Corps 1")
		
	end

	it "supprime un post" do
		visit posts_path
		page.should have_link('Delete' , :href => post_path(@post), :method => :delete)
		click_link "Delete"
		current_path.should == posts_path
		page.should_not have_content(@post.body)
	end

end
