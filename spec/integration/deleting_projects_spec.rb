require 'spec_helper'

feature "Deleting stocks" do
 scenario "Deleting a stock" do
 Factory(:stock, :name => "Advanced Micro Devices", 
 						:pe => "1", :price => "2.00", :div => "23", 
 						:symbol => "AMD")
 visit "/"
 click_link "Advanced Micro Devices"
 click_link "Delete Stock"
 page.should have_content("Stock has been deleted.")
 visit "/"
 page.should_not have_content("Advanced Micro Devices")
 end
end
