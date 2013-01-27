require 'spec_helper'

describe "Static pages" do

  describe "Application page" do  

    it "should have link 'Home' " do
      visit '/static_pages/home'  
      page.should have_link("Sign in", :href => '#')
    end

    it "should have link 'Help' " do
      visit '/static_pages/home'  
      page.should have_link("Help", :href => '#')
    end

    it "should have link 'Sign in' " do
      visit '/static_pages/home'  
      page.should have_link("Sign in", :href => '#')
    end  
  end 

  describe "Home page" do

    it "should have h1 'ZWB'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'ZWB')
    end

    it "should have title 'ZWB | Home' " do
      visit '/static_pages/home'	
      page.should have_selector('title', :text => "ZWB | Home")
    end

    it "shoul have link 'Sign up'" do
      visit '/static_pages/home'
      page.should have_link("Sign up", :href => '#')
    end
  end

  describe "Help page" do

    it "should have h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "shoul have title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => 'ZWB | Help')
    end
  end

  describe "About Us page" do

    it "should have h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have title 'Invest-Globe | About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => 'ZWB | About Us')
    end
  end

  describe "Contact Us page" do

    it "should have h1 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Us')
    end

    it "should have title" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => 'ZWB | Contact Us')
    end
  end
end
