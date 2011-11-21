require 'spec_helper'

describe 'Create comment' do

	before(:each) do
		@post = Post.create(:title => "subject1", :body => "bla bla1");
	end
	
	it 'affiche le formulaire de creation et cree un commentaire' do
		visit post_path(@post)
		page.should have_selector('form')
		page.should have_field('comment_author')
		page.should have_field('comment_body')
		page.should have_button('Comment')
		fill_in('comment_author', :with => :Testeur)
		fill_in('comment_body', :with => :TestComment)
		click_button(:Comment)
		current_path.should == post_path(@post)
		page.should have_content(:Testeur)
		page.should have_content(:TestComment)
	end
end
