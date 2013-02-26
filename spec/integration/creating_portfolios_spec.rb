require 'spec_helper'

feature 'Adding a new portfolio' do
  before do
    visit '/'
  end

  scenario 'Can create a new portfolio' do
  	click_link 'New Portfolio'
    fill_in 'Name', :with => 'Value Portfolio'
    click_button 'Create Portfolio'
    page.should have_content 'Your portfolio has been created'
    page.should have_content 'Your Portfolios'
    page.should have_link 'Value Portfolio'
  end

  scenario 'Can create another portfolio' do
  	click_link 'New Portfolio'
  	fill_in 'Name', :with => 'Mucho Gravitas'
  	click_button 'Create Portfolio'
  	page.should have_content 'Your portfolio has been created'
  	page.should have_content 'Your Portfolios'
  	page.should have_link 'Value Portfolio'
  	page.should have_link 'Mucho Gravitas'
  end  
end