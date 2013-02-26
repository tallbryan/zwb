require 'spec_helper'
	let!(:portfolio1) { Factory(:portfolio, :name => "Portfolio 1") }
	let!(:portfolio2) { Factory(:portfolio, :name => "Portfolio 2") }
	let!(:portfolio3) { Factory(:portfolio, :name => "Portfolio 3") }

feature "Editing a portfolio" do 
	before do
		visit '/'
		click_link 'Portfolios'
		click_link 'Portfolio 2'
		

	end
end