require 'spec_helper'

describe 'delete /post/:id' do
	before(:each) do
		User.create(:login => "test", :email => "test@mail.com", :password => "test123", :password_confirmation => "test123")
		visit posts_path
		click_link("Log in")
		fill_in("Login", :with => "test")
		fill_in("Password", :with => "test123")
		click_button("Login")

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
