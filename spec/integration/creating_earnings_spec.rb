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
    page.should have_content('Your Stock has been added.')
 end

scenario "can create new earnings page for a stock" do
 	click_link "Add Earnings"
 	page.should have_content('10 yrs. Earnings')
 end

scenario "can add new earnings to db for a stock" do
	click_link "Add Earnings"
	page.should have_content('10 yrs. Earnings')
 	click_button "Create Earning"	
 end
end