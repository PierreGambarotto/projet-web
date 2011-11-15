require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post,
      :title => "title 1",
      :body => "body 1"
    ).as_new_record)
  end

  it "renders new post form" do
    render
    response.should have_selector("form[action='/posts']")
    response.should have_selector("input[id='post_title']")
    response.should have_selector("textarea[id='post_body']")
  end
end
