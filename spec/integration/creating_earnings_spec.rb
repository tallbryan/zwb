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
	  0.upto(9) do |n|
      fill_in 'stock_earnings_attributes_'+n.to_s+'_earnings', :with => '2.5'+n.to_s
      fill_in 'stock_earnings_attributes_'+n.to_s+'_sheq', :with => '20'+n.to_s
      fill_in 'stock_earnings_attributes_'+n.to_s+'_pe', :with => '12'+n.to_s
      fill_in 'stock_earnings_attributes_'+n.to_s+'_div', :with => '2.2'+n.to_s
      end
 	  click_button "Update Earnings"
    page.should have_content("Stock has been updated.")
 end
end