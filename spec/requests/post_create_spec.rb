require 'spec_helper'

describe 'post_create' do

	it "affiche un lien pour creer un nouveau post" do
		visit posts_path
		page.should have_link('New Post' , :href => new_post_path) # <a href="/posts/new">New Post</a>
	end

	it "renvoi la page de creation de post qui contient un formulaire" do
		visit posts_path
		click_link('New Post')
		page.should have_content('Creation d\'un nouveau post')
		page.should have_selector('form')
		page.should have_field('post_title')
		page.should have_field('post_body')
	end
	
	it "Remplissage du formulaire" do
		visit new_post_path
		fill_in('post_title', :with => 'titre1')
		fill_in('post_body', :with => 'contenu1')
		click_button('Create Post')
		current_path.should == posts_path
		page.should have_content('titre1')
	end

end
