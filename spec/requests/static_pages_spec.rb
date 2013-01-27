require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have h1 'ZWB'" do
      visit root_path
      page.should have_selector('h1', text:'ZWB')
    end

    it "should have title 'ZWB | Home' " do
      visit root_path	
      page.should have_selector('title', text: "ZWB | Home")
    end
  end

  describe "Help page" do

    it "should have h1 'Help'" do
      visit help_path
      page.should have_selector('h1', text: 'Help')
    end

    it "shoul have title 'Help'" do
      visit help_path
      page.should have_selector('title', text: 'ZWB | Help')
    end
  end

  describe "About Us page" do

    it "should have h1 'About Us'" do
      visit about_path
      page.should have_selector('h1', text: 'About Us')
    end

    it "should have title 'Invest-Globe | About Us'" do
      visit about_path
      page.should have_selector('title', text: 'ZWB | About Us')
    end
  end

  describe "Contact Us page" do

    it "should have h1 'Contact Us'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact Us')
    end

    it "should have title" do
      visit contact_path
      page.should have_selector('title', text: 'ZWB | Contact Us')
    end
  end
end
