require 'spec_helper'

describe 'post search' do

	before(:each) do
		@posts = [Post.create(:title => "Sujet 1", :body => "Corps 1"),
							Post.create(:title => "Sujet 2", :body => "Corps 2"),
							Post.create(:title => "Pas de s...", :body => "Pas de c...")]
	end

	it 'cherche un post dont le titre contient Sujet 1' do
		visit posts_path
		click_link('Search a post')
		current_path.should == search_posts_path
		fill_in('search_title', :with => 'Sujet 1')
		click_button('Search')
		current_path.should == find_posts_path
		page.should have_content('Sujet 1')
		page.should_not have_content('Sujet 2')
		page.should_not have_content('Pas de sujet')
	end

	it 'cherche un post dont le titre contient Sujet' do
		visit posts_path
		click_link('Search a post')
		current_path.should == search_posts_path
		fill_in('search_title', :with => 'Sujet')
		click_button('Search')
		current_path.should == find_posts_path
		page.should have_content('Sujet 1')
		page.should have_content('Sujet 2')
		page.should_not have_content('Pas de sujet')
	end

	it 'cherche un post dont le corps contient Corps' do
		visit posts_path
		click_link('Search a post')
		current_path.should == search_posts_path
		fill_in('search_body', :with => 'Corps')
		click_button('Search')
		current_path.should == find_posts_path
		page.should have_content('Sujet 1')
		page.should have_content('Sujet 2')
		page.should_not have_content('Pas de sujet')
	end

	it 'cherche un post dont le titre contient Sujet et le corps 2' do
		visit posts_path
		click_link('Search a post')
		current_path.should == search_posts_path
		fill_in('search_title', :with => 'Sujet')
		fill_in('search_body', :with => '2')
		click_button('Search')
		current_path.should == find_posts_path
		page.should_not have_content('Sujet 1')
		page.should have_content('Sujet 2')
		page.should_not have_content('Pas de sujet')
	end

end
