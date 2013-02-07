require 'spec_helper'

feature 'Editing Earnings' do
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
 	click_link "Add Earnings"
 	fill_in 'earning_year', :with => '2001'
    fill_in 'earning_earnings', :with => '1.50'
    fill_in 'earning_sheq', :with => '100'
    fill_in 'earning_pe', :with => '12'
    fill_in 'earning_div', :with => '1.23'
    click_button 'Create Earning'	
    page.should have_content('Earnings Saved.')
 end

scenario "can edit earnings for a stock" do
 	click_link "Edit Earnings"
 	page.should have_content('Edit Earnings')
 	fill_in 'earning_year', :with => '2002'
    fill_in 'earning_earnings', :with => '2.50'
    fill_in 'earning_sheq', :with => '200'
    fill_in 'earning_pe', :with => '120'
    fill_in 'earning_div', :with => '2.23'
 	click_button "Update Earning"
 	page.should have_content('Earnings have been updated.')
 end

=begin
scenario "can add new earnings to db for a stock" do
	click_link "Add Earnings"
	page.should have_content('10 yrs. Earnings')
 	click_button "Create Earning"	
 end
=end

end