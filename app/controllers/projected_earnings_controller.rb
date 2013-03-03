class ProjectedEarningsController < ApplicationController

include Calc

 def show
  @stock = Stock.find(params[:stock_id])
  @real_earnings = @stock.earnings(params[:id])
  @total_projected_eps = 0
  @projected_eps = [0..10]
  @eps = @stock.price / @stock.pe
  @projected_eps[0] = (((@stock.ten_year_growth / 100) + 1) * @eps) 
   1.upto(9) do |t|
  	@projected_eps[t] =+ (((@stock.ten_year_growth / 100) + 1) * @projected_eps[t-1])
  end

   @projected_eps.each{|eps| @total_projected_eps += eps} 

   #Average P/E = real P/E /10
   @total_real_pe = 0
   @real_earnings.each{ |e| @total_real_pe += e.pe }
   #binding.pry
   @ave_pe = @total_real_pe /10 

#   Plus Div.s  =total_projected_eps * Div Payout

  @plus_divs = @total_projected_eps * @real_earnings.last[:div].percent
#binding.pry
    #expected price = projected_earnings.last *ave_pe 
@expected_price = @projected_eps.last * @ave_pe 

@total_return = @expected_price + @plus_divs 

#10 Year Total Return needed for 15% =FV(15%,10,0,Stock_Price) 

@ten_year_total_return_for_15percent = future_value(@stock.price,15,10)

#Highest price you can pay to get 15% return 
@highest_price_to_get15percent_return = present_value(@total_return,15,10)

end

end
