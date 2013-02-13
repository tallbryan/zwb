require 'spec_helper'
  
  feature 'Deleting Earnings' do
   let!(:stock) { Factory(:stock) }
   let!(:earning) { Factory(:earning, :stock => stock) }

    before do
     visit '/'
     click_link stock.name
     click_link earning.title
    end

   scenario "Deleting a ticket" do
    click_link "Delete Ticket"
    page.should have_content("Ticket has been deleted.")
    page.current_url.should == project_url(project)
   end
end
