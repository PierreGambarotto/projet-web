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
    rendered.should have_selector("h2", :text => @post.title)
    rendered.should have_content(@post.body)
    rendered.should have_link('Edit', :href => edit_post_path(@post.id))
  end
	
	describe 'commentaires' do
		it 'liste les commentaires' do
			
			render
			rendered.should have_content(@comments[0].author)
			rendered.should have_content(@comments[0].body)			
		end

		it "affiche le formulaire de nouveau commentaire" do
		  render
		  rendered.should have_link('Add a comment', :href => "/posts/#{@post.id}/comments/new")
		end
		
		it "affiche le bouton de suppression d'un commentaire" do
			render
			rendered.should have_link('Delete Comment', :href => "/posts/#{@post.id}/comments/#{@comments[0].id}", :method => :delete)
		end

	end

	
end
