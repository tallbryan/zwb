 FactoryGirl.define do 
 	factory :portfolio do
 		sequence(:name) { |n| "Portfolio #{n}"}
 	end
 end