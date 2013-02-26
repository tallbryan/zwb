 FactoryGirl.define do 
 	sequence :portfolio_name do |n|
 		"Portfolio #{n}"
 	end

 	sequence :stock_name do |n|
 		"Stock #{n}"
 	end

 	factory :portfolio do
 		name portfolio_name
 		after_build do |portfolio|
 			5.times do
 				portfolio.stocks << FactoryGirl.build(:stock, :name => stock_name, :portfolio => portfolio)
 			end
 		end
 	end
 end