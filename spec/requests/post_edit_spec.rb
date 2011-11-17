require 'spec_helper'

describe 'post_edit' do
  before(:each) do
    @post = Post.create(:title => "subject1", :body => "bla bla1");
  end
    
	it "affiche un lien pour editer un post" do
		visit posts_path
		page.should have_link('Edit' , :href => edit_post_path(@post.id))
	end

	it "renvoi la page d edition de post qui contient un formulaire" do
		visit posts_path
		click_link('Edit')
		page.should have_content('Edition d\'un nouveau post')
		page.should have_selector('form')
		page.should have_field('post_title')
		page.should have_field('post_body')
	end

	it "Remplissage du formulaire" do
		visit edit_post_path(@post.id)
		fill_in('post_title', :with => 'titre1')
		fill_in('post_body', :with => 'contenu1')
		click_button('Update Post')
		current_path.should == posts_path
		page.should have_content('titre1')
	end

end
