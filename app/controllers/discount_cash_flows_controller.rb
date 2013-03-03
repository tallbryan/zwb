class DiscountCashFlowsController < ApplicationController

include Calc

  def show
   @stock = Stock.find(params[:stock_id])
   @real_earnings = @stock.earnings(params[:id])
  @stock.guess_growth
  years = 10
  @eps = @stock.price / @stock.pe
  @total_FV  = future_value(1.95,10.percent,10)
    #future_value(@eps,@stock.guess_growth,years)
  end
end
