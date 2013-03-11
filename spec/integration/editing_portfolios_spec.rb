require 'spec_helper'

feature "Editing Portfolios" do 
	3.times do
		Factory(:portfolio)
	end
	portfolio = Factory(:portfolio)
	stock_list = [{:name => "Advanced Micro Devices", :symbol => "AMD"},
	 {:name => "Apple", :symbol => "APPL"},
	  {:name => "IBM", :symbol => "IBM"},
	  {:name => "Microsoft", :symbol => "MSFT"},
	  {:name => "Three Em", :symbol => "3M"}]
	stock_list.each do |s|
		Factory(:stock, :symbol => s[:symbol], :name => s[:name])
	end


	before do
		visit '/'
		click_link 'Portfolios'
		click_link 'Portfolio 4'
		click_link 'Edit Portfolio'
	end

	scenario "Display a list of possible stocks to add" do
		stock_list.each do |s|
			page.should have_content(s[:name])
		end
	end

	scenario "check some stocks and click add" do
		check(stock_list[1][:name])
		check(stock_list[3][:name])
		check(stock_list[4][:name])
		click_button "Update Portfolio"
	end
end