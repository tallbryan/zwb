require 'spec_helper'

feature "Viewing Stocks" do
scenario "Listing all stock current data from Yahoo" do
project = Factory.create(:project, :name => "TextMate 2")
visit '/'
click_link 'TextMate 2'
page.current_url.should == project_url(project)
end
end
