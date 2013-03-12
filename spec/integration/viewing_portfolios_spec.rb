require 'spec_helper'

feature "Viewing Portfolios" do 
	3.times do
		Factory(:portfolio)
	end


	#portfolio = Factory(:portfolio, :stock => stock)
	before do
		visit '/'
		click_link 'Portfolios'
	end

	scenario "Display all the portfolios" do
		page.should have_link('Portfolio 1')
		page.should have_link('Portfolio 2')
		page.should have_link('Portfolio 3')
	end

end