require 'spec_helper'

describe 'posts/show.html.erb' do
  before(:each) do
    @post = stub_model(Post, :title => :T1, :body => :B1, :comments[0] => @comment)
		@comments = [stub_model(Comment, :author => :toto, :body => 'Ca c\est du commentaire', :post_id => @post.id)]
		@post.comments = @comments
		assign(:post, @post)

  end

  it 'affiche un post' do
    render
    rendered.should have_selector("h1", :text => @post.title)
    rendered.should have_content(@post.body)
    rendered.should have_link('Back', :href => posts_path)
    rendered.should have_link('Edit', :href => edit_post_path(@post.id))
  end
	
	describe 'affichage des commentaires' do
		it 'liste les commentaires' do
			
			render
			rendered.should have_content(@comments[0].author)
			rendered.should have_content(@comments[0].body)			
		end
	end
end
