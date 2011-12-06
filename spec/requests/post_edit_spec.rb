require 'spec_helper'

describe 'post_edit' do
  before(:each) do
    @post = Post.create(:title => "subject1", :body => "bla bla1")
		User.create(:login => "test", :email => "test@mail.com", :password => "test123", :password_confirmation => "test123")
		visit posts_path
		click_link("Log in")
		fill_in("Login", :with => "test")
		fill_in("Password", :with => "test123")
		click_button("Login")

  end
    
	it "affiche un lien pour editer un post" do
		visit posts_path
		page.should have_link('Edit' , :href => edit_post_path(@post))
	end

	it "renvoi la page d edition de post qui contient un formulaire" do
		visit edit_post_path(@post)
		page.should have_content("Edit post")
		page.should have_selector('form')
		page.should have_field('post_title')
		page.should have_field('post_body')
	end

	it "Remplissage du formulaire" do
		visit edit_post_path(@post)
		fill_in('post_title', :with => 'titre1!!!')
		fill_in('post_body', :with => 'contenu1!!!')
		click_button('Update Post')
		current_path.should == post_path(@post)
		page.should have_content('titre1!!!')
		page.should have_content('contenu1!!!')
	end

end
