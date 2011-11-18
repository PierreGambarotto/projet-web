require 'spec_helper'

describe 'posts/show.html.erb' do
  before(:each) do
    @post = stub_model(Post, :author => :T1, :body => :B1)
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
			@comments = [stub_model(Comment, :title => :TitreCommentaire1, :body => :Commentaire1),
									stub_model(Comment, :title => :TitreCommentaire2, :body => :Commentaire2)]
			assign(:comments, @comments)
			render
			@comments.each do |comment| 
				rendered.should have_content(comment.author)
				rendered.should have_content(comment.body)
			end
			
		end
	end
end
