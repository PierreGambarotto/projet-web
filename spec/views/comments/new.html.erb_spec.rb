require 'spec_helper'

describe 'comments/new.html.erb' do
	before(:each) do
    @post = stub_model(Post, :title => :T1, :body => :B1, :comments[0] => @comment)
		assign(:post, @post)

  end

	it "affiche le formulaire de nouveau commentaire" do
	  render
	  rendered.should have_selector("form[action='/posts/#{@post.id}/comments']")
	  rendered.should have_selector("input[id='comment_author']")
	  rendered.should have_selector("textarea[id='comment_body']")
	  rendered.should have_selector("input[value='Comment']")
	end

	it "affiche un lien de retour vers le post" do
		render
		rendered.should have_link('Back', :href => post_path(@post.id))
	end

end
