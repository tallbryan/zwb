require 'yahoofinance'

YahooFinance::STDHASH = {
	"s" => [ "symbol", "val"],
	"n" => [ "name", "val"],
	"l1" => [ "lastTrade", "val.to_f"],
	"r" => [ "peRatio", "val.to_f"],
	"y" => [ "dividendYield", "convert(val)"]
}

class StocksController < ApplicationController

 before_filter :find_stock, :only => [:show, :edit, :update, :destroy]

 def index
  puts params
  @stocks = Stock.all
 end

 def new
 	puts params
 	@stock = Stock.new
 end 
 
 def edit
  puts params
  @stock = Stock.find(params[:id])
 	
=begin
  quote_type = YahooFinance::StandardQuote
  quote_symbols = @stock.symbol

  YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
	puts "QUOTING #{qt.symbol}"
	puts qt.to_s
	@qt = qt
  end
=end
 end

 def update
  @stock = Stock.find(params[:id])
  if @stock.update_attributes(params[:stock])
   flash[:notice] = "Stock has been updated."
   redirect_to @stock
  else
   flash[:alert] = "Stock has not been updated."
   render :action => "edit"
  end
 end


 def create
  puts params
  @stock = Stock.new(params[:stock])

  if @stock.save
   flash[:notice] = "Your Stock has been added."
   redirect_to @stock
  else
   flash[:alert] = "Your Stock has not been Added."
   render :action => "new"
  end
 end

 def show
  puts params
  @stock = Stock.find(params[:id])
 end

 def destroy
  @stock = Stock.find(params[:id])
  @stock.destroy
  flash[:notice] = "Stock has been deleted."
  redirect_to stocks_path
 end

 private
  def find_stock
    @stock = Stock.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The stock you were looking for could not be found."
    redirect_to stocks_path
  end
end
