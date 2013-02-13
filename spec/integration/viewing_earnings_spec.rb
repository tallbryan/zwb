require 'spec_helper'

  feature "Viewing Earnings" do
   before do
    abt = Factory(:stock, :name => "Abbott Labs", 
                  :pe => "1", :price => "2.00", :div => "23", 
                  :symbol => "ABT")
    Factory(:earning,
            :stock => abt,
            :pe => "12",
            :div => "123")          

    msft = Factory(:stock, :name => "Microsoft",
                   :pe => "12", :price => "22.00", :div => "3", 
                   :symbol => "MSFT")
    Factory(:earning,
            :stock => msft,
            :pe => "12345",
            :div => "123490")
    visit '/'
 end
  
  scenario "Viewing Earnings for a given Stock" do
   #binding.pry
   click_link "Abbott Labs"
   page.should have_content("ABT")
   page.should_not have_content("MSFT")
   page.should have_content("Earnings")
  end
end