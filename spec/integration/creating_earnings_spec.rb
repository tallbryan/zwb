require 'spec_helper'

feature 'Adding Stock to List ' do
 before do
  visit '/'
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
    visit '/'
    click_link 'Add Earnings'
	  page.should have_content('10 yrs. Earnings') 
	  fill_in 'earning_year', :with => '2002'
    fill_in 'earning_earnings', :with => '2.50'
    fill_in 'earning_sheq', :with => '200'
    fill_in 'earning_pe', :with => '120'
    fill_in 'earning_div', :with => '2.23'
 	  click_button "Create Earning"
    page.should have_content("Earnings Saved.")
 end
end