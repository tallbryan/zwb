require 'spec_helper'

describe "Static pages" do
  
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text:'ZWB') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', :text => '| Home')} 
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About Us page" do
    before { visit about_path }

    it { should have_selector('h1', text: 'About Us') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact Us page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_selector('title', text: full_title('Contact Us')) }
  end
  it "should have the right link on the layout" do
    visit root_path
    click_link "About Us"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact Us"
  end
end
