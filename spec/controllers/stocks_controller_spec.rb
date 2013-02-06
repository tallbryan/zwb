require 'spec_helper'

 describe StocksController do
  
  it "displays an error for a missing stock" do
   get :show, :id => "not-here"
   response.should redirect_to(stocks_path)
   message = "The stock you were looking for could not be found."
   flash[:alert].should == message
  end
 end