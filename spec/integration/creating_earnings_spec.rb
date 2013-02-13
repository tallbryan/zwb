require 'spec_helper'

feature 'Adding Stock to List ' do
 before do
  e = Factory.create(:earning,
    :year => "2013",
    :earning => "123",
    :sheq => "12.0",
    :pe => "1",
    :div => "100")
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
    click_link 'Advanced Mirco Devices'
	  page.should have_content('10 yrs. Earnings') 
    binding.pry
	  fill_in ':year', :with => '2002'
    fill_in ':earnings', :with => '2.50'
    fill_in 'earning_sheq', :with => '200'
    fill_in 'earning_pe', :with => '120'
    fill_in 'earning_div', :with => '2.23'
 	  click_button "Create Earning"
    page.should have_content("Earnings Saved.")
 end
end