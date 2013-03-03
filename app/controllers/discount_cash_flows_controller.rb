class DiscountCashFlowsController < ApplicationController

include Calc

  def show
  	
 	@Two_Stage_Dividend_Discount_Model = {:prior_year_cash_flow => 0,
 		                                  :stock_guess_growth => 1, 
 		                                  :cash_flow => 2, 
                                          :discount_factor => 3, 
 		                                  :total => 4
 		                                 }
    @array = {}
   

   @stock = Stock.find(params[:stock_id])
   @real_earnings = @stock.earnings(params[:id])
  @stock.guess_growth
  years = 10
  @eps = (@stock.price / @stock.pe).round(2)
   # @total_FV  = future_value(1.95,10,10)
    #future_value(@eps,@stock.guess_growth,years)
  #@Two_Stage_Dividend_Discount_Model[0][0] = @eps
@array[0] = [ @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow] = @eps,
           @Two_Stage_Dividend_Discount_Model[:stock_guess_growth]   = @stock.guess_growth,
           @Two_Stage_Dividend_Discount_Model[:cash_flow]            = ((@eps * @stock.guess_growth.percent) + @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow]).round(2),
           @Two_Stage_Dividend_Discount_Model[:discount_factor]      = (1/ (1+10.percent)).round(4),
           @Two_Stage_Dividend_Discount_Model[:total]                = (@Two_Stage_Dividend_Discount_Model[:cash_flow] * @Two_Stage_Dividend_Discount_Model[:discount_factor]).round(2)
          ]

  1.upto(9) do |i|
   	@array[i] = [ @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow] = @array[i-1][2],
                 @Two_Stage_Dividend_Discount_Model[:stock_guess_growth] = @stock.guess_growth,
                 @Two_Stage_Dividend_Discount_Model[:cash_flow] =  (( @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow] * @stock.guess_growth.percent) + @Two_Stage_Dividend_Discount_Model[:prior_year_cash_flow]).round(2),
                 @Two_Stage_Dividend_Discount_Model[:discount_factor] = (@array[i-1][3]/ (1+10.percent)).round(4),
                 @Two_Stage_Dividend_Discount_Model[:total] = (@Two_Stage_Dividend_Discount_Model[:cash_flow] *  @Two_Stage_Dividend_Discount_Model[:discount_factor]).round(2)
                ]
   end

  end
end
