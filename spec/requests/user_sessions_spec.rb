require 'spec_helper'

describe "create session" do
	before(:all) do
		User.create(:login => "test", :email => "test@mail.com", :password => "test123", :password_confirmation => "test123")
	end

	it "log in then out" do
		visit posts_path
		click_link("Log in")
		fill_in("Login", :with => "test")
		fill_in("Password", :with => "test123")
		click_button("Login")
		page.should have_content("Login successful!")
		page.should have_link("Log out")
	
		click_link("Log out")
		page.should have_content("Logout successful!")
		page.should have_link("Log in")
	end

end
