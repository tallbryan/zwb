require 'spec_helper'

feature 'Adding Stock to List ' do
 before do
 	visit '/'
 	click_link 'New Stock'
 end

 scenario "can add a stock" do
  fill_in 'Name', :with => 'Advanced Mirco Devices'
  fill_in 'Symbol', :with => 'AMD'
  fill_in 'Price', :with => '3.34'
  fill_in 'Pe', :with => '12'
  fill_in 'Div', :with => '1.23'
  click_button 'Create Stock'
  page.should have_content('Stock has been added.')
 end

 scenario "can not create a stock without a name, symbol, price, pe, or div" do
  click_button 'Create Stock'
  page.should have_content("Your Stock has not been Added.")
  page.should have_content("Name can't be blank")
 end
end 
