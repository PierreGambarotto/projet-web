require 'spec_helper'

describe "users/new.html.erb" do
	it "affiche un formulaire de creation d utilisateur" do		
		render
		rendered.should have_selector("form[action='/users']")
    rendered.should have_selector("input[id='login']")
    rendered.should have_selector("input[id='password']")
    rendered.should have_selector("input[id='email']")
		rendered.should have_selector("input[type='password']")
    rendered.should have_selector("input[type='submit']")
    rendered.should have_link('Back', :href => posts_path)
	end
end
