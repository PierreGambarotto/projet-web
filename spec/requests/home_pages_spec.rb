require 'spec_helper'

describe "HomePages" do

	before(:each) do
		@post1 = Post.create(:title => "subject1", :body => "bla bla");
		@post2 = Post.create(:title => "subject2", :body => "bla bla");
	end

  describe "GET /posts" do
    it "generates a listing of posts" do
			get posts_path
			response.body.should include(@post1.title)
			response.body.should include(@post2.title)
    end
		
		it "affiche un lien pour creer un nouveau post" do
			visit posts_path
			page.should have_link('New Post' , :href => '/posts/new') # <a href="/posts/new">New Post</a>
		end
	
		it "renvoi la page de creation de post qui contient un formulaire" do
			visit posts_path
			click_link('New Post')
			page.should have_content('Creation d\'un nouveau post')
			page.should have_selector('form')
			page.should have_field('post_title')
			page.should have_field('post_body')
		end
  end
		
		it "Remplissage du formulaire" do
			visit new_post_path
			fill_in('post_title', :with => 'titre1')
			fill_in('post_body', :with => 'contenu1')
			click_button('Create Post')
			current_path.should == posts_path
			page.should have_content('titre1')
		end

		it "liens clicables sur les posts" do
			visit posts_path
			page.should have_link('Show', :href => post_path(@post1.id))
      page.should have_link('Edit', :href => edit_post_path(@post1.id))
		end

end
