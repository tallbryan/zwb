require 'yahoofincance'

YahooFinance::STDHASH = {
	"s" => [ "symbol", "val"],
	"n" => [ "name", "val"],
	"l1" => [ "lastTrade", "val.to_f"],
	"r" => [ "peRatio", "val.to_f"],
	"y" => [ "dividendYield", "convert(val)"]
}

class YahooDataController < ApplicationController
 
 def new 
 end 
 
 def index
 end

 def get_current_stock_data
 	 quote_type = YahooFinance::StandardQuote
     quote_symbols = "MSFT"

     YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
	 puts "QUOTING #{qt.symbol}"
	 puts qt.to_s
	 @qt = qt
    end
 	
 end

end
