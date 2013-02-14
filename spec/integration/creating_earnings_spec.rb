require 'spec_helper'

feature 'Adding Stock to List ' do
 before do
  visit '/stocks'
  click_link 'New Stock'
  fill_in 'Name', :with => 'Advanced Mirco Devices'
  fill_in 'Symbol', :with => 'AMD'
  fill_in 'Price', :with => '3.34'
  fill_in 'Pe', :with => '12'
  fill_in 'Div', :with => '1.23'
  click_button 'Create Stock'
  page.should have_content('Stock has been added.')
 end

scenario "can add new earnings to db for a stock" do
    visit '/stocks'
    click_link 'Advanced Mirco Devices'  
	  page.should have_content('Earnings') 
    click_link' Add Earnings '
    binding.pry
	  fill_in ':year', :with => '2002'
    fill_in 'earning.earnings', :with => '2.50'
    fill_in 'earning_sheq', :with => '200'
    fill_in 'earning_pe', :with => '120'
    fill_in 'earning_div', :with => '2.23'
 	  click_button "Update Earnings"
    page.should have_content("Earnings Saved.")
 end
end