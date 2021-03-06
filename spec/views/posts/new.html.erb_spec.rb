require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    # on positionne les variables que va recevoir la vue
    assign(:post, stub_model(Post,
      :title => "title 1",
      :body => "body 1"
    ).as_new_record)
  end

  it "renders new post form" do
    render
    rendered.should have_selector("form[action='/posts']")
    rendered.should have_selector("input[id='post_title']")
    rendered.should have_selector("textarea[id='post_body']")
    rendered.should have_selector("input[type='submit']")
    rendered.should have_link('Back', :href => posts_path)
  end
end
