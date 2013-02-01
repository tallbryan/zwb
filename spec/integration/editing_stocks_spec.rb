require 'spec_helper'
 feature "Editing Stocks" do
  scenario "Updating a Stock" do
  Factory(:stock, :name => "Advanced Micro Devices", 
 						:pe => "1", :price => "2.00", :div => "23", 
 						:symbol => "AMD")
  visit "/"
  click_link "Advanced Micro Devices"
  click_link "Edit Stock"
  fill_in "Name", :with => "Advanced Micro Devices beta"
  click_button 'Update Stock'
  page.should have_content("Stock has been updated.")
 end
end
