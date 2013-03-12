

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

  @plus_divs = @total_projected_eps * @real_earnings.last[:div].percent

  @expected_price = @projected_eps.last * @ave_pe 

  @total_return = @expected_price + @plus_divs 

  @ten_year_total_return_for_15percent = future_value(@stock.price,15,10)

  @highest_price_to_get15percent_return = present_value(@total_return,15,10)

  @dollar_difference = (@highest_price_to_get15percent_return - @stock.price)

   if @stock.update_attributes(:dollar_difference => @dollar_difference, 
                               :buy_at => @highest_price_to_get15percent_return)
    flash[:notice] = "Saved :buy_at and :dollar_difference to db."
   #binding.pry
   else
    flash[:alert] = ":buy_at and :dollar_difference have not been updated."
   end

   make_buy_decision
   #redirect_to @stock

 end
 
 def make_buy_decision
  if @stock.difference > 0 and @stock.dollar_difference > 0
     @stock.update_attributes(:buy_decision => "Buy")
  else
     @stock.update_attributes(:buy_decision => nil)
  end
 end

end
