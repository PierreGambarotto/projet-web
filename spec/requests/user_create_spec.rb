require 'spec_helper'

describe 'post_create' do


	before(:each) do
		User.create(:login => "test", :email => "test@mail.com", :password => "test123", :password_confirmation => "test123")
		visit posts_path
		click_link("Log in")
		fill_in("Login", :with => "test")
		fill_in("Password", :with => "test123")
		click_button("Login")
	end

	it "affiche un lien pour creer un nouvel utilisateur" do
		visit posts_path
		page.should have_link('Create user' , :href => new_user_path)
		click_link ('Log out')
	end

	it "renvoi la page de creation d utilisateur qui contient un formulaire" do
		visit posts_path
		click_link('Create user')
		page.should have_content('Create a new user')
		page.should have_selector('form')
		page.should have_field('login')
		page.should have_field('email')
		page.should have_field('password')
		page.should have_field('password_confirmation')
		click_link ('Log out')
	end

	it "Remplissage du formulaire" do
		user_id = 'test' + rand().to_s
		puts 'user : ' + user_id
		visit new_user_path
		fill_in('login', :with => user_id)
		fill_in('email', :with => user_id + '@mail.com')
		fill_in('password', :with => 'test123')
		fill_in('password_confirmation', :with => 'test123')
		click_button('Create')
		page.should have_content('User created sucessfully')
		current_path.should == posts_path
		click_link ('Log out')
	end

end
