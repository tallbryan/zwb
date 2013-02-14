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
    page.should have_content('Stock has been added.')
    visit '/'
    click_link 'Advanced Mirco Devices'  
    page.should have_content('Earnings') 
 	click_link 'Add Earnings'
 	fill_in 'stock_earnings_attributes_0_year', :with => '2002'
    fill_in 'stock_earnings_attributes_0_earnings', :with => '2.50'
    fill_in 'stock_earnings_attributes_0_sheq', :with => '200'
    fill_in 'stock_earnings_attributes_0_pe', :with => '120'
    fill_in 'stock_earnings_attributes_0_div', :with => '2.23'
    click_button "Update Earnings"
    page.should have_content("Stock has been updated.")
 end

scenario "can edit earnings for a stock" do
    visit '/'
 	click_link "Advanced Mirco Devices"
 	page.should have_content('Earnings')
    click_link '| Edit Earnings |'
    page.should have_content('Edit Earnings')
 	fill_in 'stock_earnings_attributes_0_year', :with => '2003'
    fill_in 'stock_earnings_attributes_0_earnings', :with => '3.50'
    fill_in 'stock_earnings_attributes_0_sheq', :with => '300'
    fill_in 'stock_earnings_attributes_0_pe', :with => '320'
    fill_in 'stock_earnings_attributes_0_div', :with => '3.23'
 	click_button "Update Earnings"
 	page.should have_content("Stock has been updated.")
 end

=begin
scenario "can add new earnings to db for a stock" do
	click_link "Add Earnings"
	page.should have_content('10 yrs. Earnings')
 	click_button "Create Earning"	
 end
=end

end