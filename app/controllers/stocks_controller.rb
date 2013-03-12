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
  @stocks = Stock.all
  
  if params[:format] == "update_all"
     quote_type = YahooFinance::StandardQuote
     quote_symbols = []
     
     @stocks.each{|s| quote_symbols << s.symbol}

     YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
       qt.to_s
       @stocks.each do |s|  
         if s.symbol.upcase == qt.symbol.upcase then 
           stock = Stock.find(s.id)
            if stock.update_attributes(:price => qt.lastTrade, :pe => qt.peRatio, :div => qt.dividendYield )
             flash[:notice] = "Your stock has been updated."
            else
             flash[:alert] = "Your stock has not been updated."
            end
         end
       end 
     end
     #redirect_to stocks_path 
  end 
 end

 def new
 	#flash[:notice] = "#{params}"
 	@stock = Stock.new
 end 
 
 def edit
  @stock = Stock.find(params[:id])
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
  @stock = Stock.find(params[:id])
  @earning = @stock.earnings
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
