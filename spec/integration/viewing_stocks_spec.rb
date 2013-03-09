require 'spec_helper'

feature "Viewing Stocks" do
	
 scenario "Listing all stock current data from db" do
 stock = Factory(:stock, :name => "Advanced Micro Devices", 
 						:pe => "1", :price => "2.00", :div => "23", 
 						:symbol => "AMD")
 visit '/'
 click_link 'Advanced Micro Devices'
 page.current_url.should == stock_url(stock)
 end
end
