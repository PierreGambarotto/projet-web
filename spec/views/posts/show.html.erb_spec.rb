require 'spec_helper'

describe 'posts/show.html.erb' do
  before(:each) do
    @post = stub_model(Post, :title => :T1, :body => :B1)
    assign(:post, @post)
  end

  it 'affiche un post' do
    render
    rendered.should have_selector("h1", :text => @post.title)
    rendered.should have_content(@post.body)
    rendered.should have_link('Back', :href => posts_path)
    rendered.should have_link('Edit', :href => edit_post_path(@post.id))
  end
end
