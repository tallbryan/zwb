require 'spec_helper'

feature 'Adding Stock to List ' do
scenario "can add a stock" do
visit '/'
click_link 'New Stock'
fill_in 'Name', :with => 'Advanced Mirco Devices'
fill_in 'Symbol', :with => 'AMD'
click_button 'Create Stock'
page.should have_content('Stock has been added.	')
end
end
