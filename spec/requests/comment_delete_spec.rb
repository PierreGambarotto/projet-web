require 'spec_helper'

describe 'Delete comment' do
	before(:each) do
		@post = Post.create(:title => "subject1", :body => "bla bla1")
		@post.comments.create(:author => :Testeur, :body => :TestComment)

		User.create(:login => "test", :email => "test@mail.com", :password => "test123", :password_confirmation => "test123")
		visit posts_path
		click_link("Log in")
		fill_in("Login", :with => "test")
		fill_in("Password", :with => "test123")
		click_button("Login")
	end
	
	it "Supprime un commentaire de la page" do
		visit post_path(@post)
		page.should have_content(:Testeur)
		page.should have_content(:TestComment)
		click_link "Delete"
		page.should_not have_content(:Testeur)
		page.should_not have_content(:TestComment)
		current_path.should == post_path(@post)	
	end

end
