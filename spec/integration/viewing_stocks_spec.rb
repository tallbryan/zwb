require 'spec_helper'

feature "Viewing Stocks" do
scenario "Listing all stock current data from Yahoo" do
#ydata = Factory.create(:yahoo_stock_data, :name => "AMD")
visit '/'
click_link 'Update Stocks'
page.current_url.should == yahoo_data_url(@yahoo_data)
end
end
