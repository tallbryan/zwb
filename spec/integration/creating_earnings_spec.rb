require 'spec_helper'

feature 'Adding Stock to List ' do
 before do
  visit '/stocks'
  binding.pry
  click_link 'amd'


 end

scenario "can add new earnings to db for a stock" do
	  page.should have_content('10 yrs. Earnings') 
	  fill_in 'earning.year', :with => '2002'
    fill_in 'earning.earnings', :with => '2.50'
    fill_in 'earning_sheq', :with => '200'
    fill_in 'earning_pe', :with => '120'
    fill_in 'earning_div', :with => '2.23'
 	  click_button "Create Earning"
    page.should have_content("Earnings Saved.")
 end
end