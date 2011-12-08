require 'spec_helper'

describe "user_sessions/new.html.erb" do

  it "renders login form" do
    render
    rendered.should have_selector("form[action='/user_sessions']")
    rendered.should have_selector("input[id='login']")
    rendered.should have_selector("input[id='password']")
		rendered.should have_selector("input[type='password']")
    rendered.should have_selector("input[type='submit']")
    rendered.should have_link('Back', :href => posts_path)
  end
end
