class DiscountCashFlowsController < ApplicationController

include Calc

 def show 	
 	@Two_Stage_Dividend_Discount_Model = {:prior_year_cash_flow => 0,
 		                                    :stock_guess_growth => 1, 
 		                                    :cash_flow => 2, 
                                        :discount_factor => 3, 
 		                                    :total => 4
 		                                    }
  @hash = {}
   
  @stock = Stock.find(params[:stock_id])
  @real_earnings = @stock.earnings(params[:id])
  years = 10
  @eps = (@stock.price / @stock.pe)
  @hash[0] = [ 
           @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow] = @eps.round(2),
           @Two_Stage_Dividend_Discount_Model[:stock_guess_growth]   = @stock.guess_growth,
           @Two_Stage_Dividend_Discount_Model[:cash_flow]            = ((@eps * @stock.guess_growth.percent) + @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow]).round(2),
           @Two_Stage_Dividend_Discount_Model[:discount_factor]      = (1/ (1+10.percent)).round(4),
           @Two_Stage_Dividend_Discount_Model[:total]                = (@Two_Stage_Dividend_Discount_Model[:cash_flow] * @Two_Stage_Dividend_Discount_Model[:discount_factor]).round(2)
          ]

  1.upto(9) do |i|
   	@hash[i] = [ 
                 @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow] = @hash[i-1][2],
                 @Two_Stage_Dividend_Discount_Model[:stock_guess_growth] = @stock.guess_growth,
                 @Two_Stage_Dividend_Discount_Model[:cash_flow] =  (( @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow] * @stock.guess_growth.percent) + @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow]).round(2),
                 @Two_Stage_Dividend_Discount_Model[:discount_factor] = (@hash[i-1][3]/ (1+10.percent)).round(4),
                 @Two_Stage_Dividend_Discount_Model[:total] = (@Two_Stage_Dividend_Discount_Model[:cash_flow] *  @Two_Stage_Dividend_Discount_Model[:discount_factor]).round(2)
                ]
   end

  residual_values

 end

 def residual_values
  second_stage_growth_rate = 5.percent
  t_bill_yield = 10.percent
  
  cashflow_in_ten_years =  @hash[9][2]
  discount_factor_at_year_ten = @hash[9][3]
  discount_total_totals  = 0
  @hash.each{|k,v| discount_total_totals += v[4]}
  
  @total_second_stage_growth = ((second_stage_growth_rate * cashflow_in_ten_years) +cashflow_in_ten_years)
  @capitization_rate = (t_bill_yield - second_stage_growth_rate)
  @value_at_year_ten = @total_second_stage_growth / @capitization_rate 
  @present_value_of_residual = (@value_at_year_ten * discount_factor_at_year_ten)
  @market_value_of_company = (discount_total_totals + @present_value_of_residual)
  @margin_of_saftey = (@market_value_of_company - @stock.price)
  @margin_of_saftey_percent = ((@margin_of_saftey / @stock.price) * 100)
  @buy_price  = @market_value_of_company * 75.percent

  @difference = (((@market_value_of_company -@stock.price) / @stock.price) * 100)
 
 if @stock.update_attributes(:difference => @difference, 
                             :market_value => @market_value_of_company)
   flash[:notice] = "Saved :market_value and :difference to db."
   #binding.pry
  else
   flash[:alert] = ":market_value and :difference have not been updated."
  end

 end
end
