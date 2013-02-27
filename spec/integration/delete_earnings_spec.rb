require 'spec_helper'
  
  feature 'Deleting Earnings' do
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

      visit '/stocks'
      click_link 'Advanced Mirco Devices'  
      page.should have_content('Earnings') 
      click_link' Add Earnings '
      fill_in 'stock_earnings_attributes_0_year', :with => '2002'
      fill_in 'stock_earnings_attributes_0_earnings', :with => '2.50'
      fill_in 'stock_earnings_attributes_0_sheq', :with => '200'
      fill_in 'stock_earnings_attributes_0_pe', :with => '120'
      fill_in 'stock_earnings_attributes_0_div', :with => '2.23'
      click_button "Update Earnings"
      page.should have_content("Stock has been updated.")
      end

   scenario "Deleting an earning" do
    visit '/stocks'
    click_link 'Advanced Mirco Devices' 
    click_link 'Edit Earnings'
    check("stock_earnings_attributes_0__destroy")
    click_button 'Update Earnings'
    page.should have_content("Stock has been updated.")
   end
end
