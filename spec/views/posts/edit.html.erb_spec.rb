require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @post = stub_model(Post, :title => "title 1", :body => "body 1")
    assign(:post, @post)
  end

  it "renders edit post form" do
    render
    rendered.should have_selector("form[action='/posts/#{@post.id}']")
    rendered.should have_selector("input[id='post_title']")
    rendered.should have_selector("textarea[id='post_body']")
    rendered.should have_selector("input[type='submit']")
    rendered.should have_link('Back', :href => post_path(@post))
  end
end
