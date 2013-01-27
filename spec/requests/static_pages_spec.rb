require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    before { visit root_path }

    it "should have h1 'ZWB'" do
      page.should have_selector('h1', text:'ZWB')
    end

    it "should have title 'ZWB | Home' " do	
      page.should have_selector('title', text: "ZWB | Home")
    end
  end

  describe "Help page" do

    before { visit help_path }

    it "should have h1 'Help'" do     
      page.should have_selector('h1', text: 'Help')
    end

    it "shoul have title 'Help'" do
      page.should have_selector('title', text: 'ZWB | Help')
    end
  end

  describe "About Us page" do

    before { visit about_path }

    it "should have h1 'About Us'" do     
      page.should have_selector('h1', text: 'About Us')
    end

    it "should have title 'Invest-Globe | About Us'" do
      page.should have_selector('title', text: 'ZWB | About Us')
    end
  end

  describe "Contact Us page" do

    before { visit contact_path }

    it "should have h1 'Contact Us'" do     
      page.should have_selector('h1', text: 'Contact Us')
    end

    it "should have title" do
      page.should have_selector('title', text: 'ZWB | Contact Us')
    end
  end
end
