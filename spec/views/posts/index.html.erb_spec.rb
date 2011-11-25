require 'spec_helper'

describe "posts/index.html.erb" do
  it "displays all the posts" do
		@posts = [
	           stub_model(Post, :title => "sujet 1", :body => "corps1"),
  	         stub_model(Post, :title => "sujet 2", :body => "corps2")]
    assign(:posts, @posts)

    render
		@posts.each do |post|
			rendered.should have_link('Show', :href => post_path(post.id))
			rendered.should have_link('Edit', :href => edit_post_path(post.id))
			rendered.should have_link('Delete', :href => post_path(post.id), :method => :delete)
		end
    rendered.should =~ /sujet 1/
    rendered.should =~ /sujet 2/
  end
end
