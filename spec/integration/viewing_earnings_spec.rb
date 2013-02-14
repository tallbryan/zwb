require 'spec_helper'

  feature "Viewing Earnings" do
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
 end
  
  scenario "Viewing Earnings for a given Stock" do
   click_link "Advanced Mirco Devices"
   page.should have_content('AMD') 
   page.should_not have_content("MSFT")
   page.should have_content("Earnings")
  end
end