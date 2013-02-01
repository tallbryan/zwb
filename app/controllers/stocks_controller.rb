require 'yahoofinance'

YahooFinance::STDHASH = {
	"s" => [ "symbol", "val"],
	"n" => [ "name", "val"],
	"l1" => [ "lastTrade", "val.to_f"],
	"r" => [ "peRatio", "val.to_f"],
	"y" => [ "dividendYield", "convert(val)"]
}


class StocksController < ApplicationController

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
  @stock.update_attributes(params[:stock])
  flash[:notice] = "Stock has been updated."
  redirect_to @stock
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
end
