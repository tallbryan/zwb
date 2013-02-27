require 'spec_helper'

feature "Editing Portfolios" do 
	3.times do
		Factory(:portfolio)
	end
	portfolio = Factory(:portfolio)
	stock_list = ["AMD", "AAPL", "IBM", "MSFT", "MMM"]
	binding.pry
	stock_list.each do |s|
		Factory(:stock, :symbol => s, :portfolio => portfolio)
	end


	#portfolio = Factory(:portfolio, :stock => stock)
	before do
		visit '/'
		click_link 'Portfolios'
		click_link 'Portfolio 4'
		click_button 'Edit Portfolio'
	end

	scenario "Display a list of possible stocks to add" do
		stock_list.each do |s|
			page.should have_content(s)
		end
	end

	scenario "check some stocks and click add" do
		check_stock_box stock_list[1]
		check_stock_box stock_list[3]
		check_stock_box stock_list[5]
		click_button "Add Stocks"
	end
end