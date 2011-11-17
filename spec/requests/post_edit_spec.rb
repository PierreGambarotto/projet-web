require 'spec_helper'

describe 'post_edit' do
  before(:each) do
    @posts = [Post.create(:title => "subject1", :body => "bla bla1"),
              Post.create(:title => "subject2", :body => "bla bla2")]
    
  end
    
	it "affiche un lien pour editer un post" do
		visit posts_path
		page.should have_link('Edit' , :href => edit_post_path(@post.id))
	end

	it "renvoi la page d edition de post qui contient un formulaire" do
		visit posts_path
    within ("tr#td", :text => @posts[2].title) do
			click_link :Edit
		end

		page.should have_content('Edition d\'un nouveau post')
		page.should have_selector('form')
		page.should have_field('post_title')
		page.should have_field('post_body')
	end

	it "Remplissage du formulaire" do
		visit edit_post_path(@posts[1].id)
		fill_in('post_title', :with => 'titre1')
		fill_in('post_body', :with => 'contenu1')
		click_button('Update Post')
		current_path.should == posts_path
		page.should have_content('titre1')
	end

end
