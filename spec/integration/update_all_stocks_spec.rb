require 'spec_helper'

 feature "Updating Stocks with latest data" do
  before do
 
    Factory(:stock, :name => "Advanced Micro Devices", 
 						:pe => "1", :price => "2.00", :div => "23", 
 						:symbol => "AMD")
  end

 scenario "Updating all Stocks" do
  visit "/"
  click_link "Update All Stocks"
  page.should have_content("Will, your Stock has been updated.")
 end
end