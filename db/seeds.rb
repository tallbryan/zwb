
def add_earnings_to_stock(stock, hist_earnings, hist_pe, hist_div, hist_sheq)
 @date = Date.current  
 @ten_years_ago = @date.years_ago(10).to_s.split(/-/)

 10.times do  |e|
   @earning = stock.earnings.build
   @earning.year = (@ten_years_ago[0].to_i + e )
   @earning.earnings = hist_earnings[e]
   @earning.pe = hist_pe[e]
   @earning.div = hist_div[e]
   @earning.sheq = hist_sheq[e] 
   @earning.save
  end
end

@abt = Stock.create(:name => "Abbott Labs", :pe => "20.1", :price => 39.10, :div => "1.95", 
					:symbol => "ABT",:guess_growth => "10", :ten_year_growth => "12" )

abt_hist_earnings = [0.85,0.94,1.06,1.21,1.34,1.51,1.66,1.78,1.88,2.06]
abt_hist_pe = [15.9,15.9,18.1,18.7,23.1,27.1,26.3,23.5,26.6,22.3]
abt_hist_div = [39,40,39,39,39,38,39,41,43,44]
abt_hist_sheq = [38.1, 37.538,4,39.0,41.9,40.8,34.7,32.5,32.5,30.4]

add_earnings_to_stock(@abt, abt_hist_earnings, abt_hist_pe, abt_hist_div, abt_hist_sheq)
 

@wmt = Stock.create(:name => "Walmart", :pe => "23.2", :price => "53.01", :div => "2.29", 
 		            :symbol => "WMT", :guess_growth => "9", :ten_year_growth => "16")

wmt_hist_earnings = [ 0.51,0.59,0.60,0.67,0.78,0.99,1.28,1.40,1.50,1.81]
wmt_hist_pe = [27.0,20.9,20.4,18.4,21.8,31.2,39.1,38.0,34.9,30.3]
wmt_hist_div = [12,13,15,17,18,17,15,16,17,19]
wmt_hist_sheq = [21.7,21.1,18.6,17.8,19.1,21.0,22.1,20.1,19.1,20.4]

add_earnings_to_stock(@wmt, wmt_hist_earnings, wmt_hist_pe, wmt_hist_div, wmt_hist_sheq)


Stock.create(:name => "Apple", :pe => "1", :price => "2.00", :div => "23", 
 						:symbol => "AAPL",)
Stock.create(:name => "Pfizer", :pe => "1", :price => "2.00", :div => "23", 
 						:symbol => "PFZ")
Stock.create(:name => "Honeywell", :pe => "1", :price => "2.00", :div => "23", 
 						:symbol => "HNY")


Portfolio.create(:name => "Celery Muncher")
