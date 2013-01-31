require 'yahoofinance'

YahooFinance::STDHASH = {
	"s" => [ "symbol", "val"],
	"n" => [ "name", "val"],
	"l1" => [ "lastTrade", "val.to_f"],
	"r" => [ "peRatio", "val.to_f"],
	"y" => [ "dividendYield", "convert(val)"]
}

class YahooDataController < ApplicationController
 
 def new_yahoo_datum 
 end 
 
 def yahoo_data
 end

 def edit_yahoo_datum
 	 quote_type = YahooFinance::StandardQuote
     quote_symbols = "MSFT", "AMD"

     YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
	 puts "QUOTING #{qt.symbol}"
	 puts qt.to_s
	 @qt = qt
    end
 	
 end

 def yahoo_datum
 end

 end
