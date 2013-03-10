require 'spec_helper'

describe "Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h3', text: 'Stock List') }
    it { should have_selector('title', text: full_title('')) }
  end

  describe "Sign in" do
    before { visit signin_path }
  	
    it { should have_selector('h1', text: 'Sign in') } 
    it { should have_selector('title', text: full_title('Sign in')) }
  end


# Remember to test the rest of the links on the layout like ....

  it "should have the right link on the layout" do
    visit root_path
    click_link ""
    page.should have_selector 'title', text: full_title('Sto')
    visit root_path
    click_link "Sign in"
    page.should have_selector 'title', text: full_title('Sign in')
  end
end 