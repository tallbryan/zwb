class EarningsController < ApplicationController

 before_filter :find_stock
 before_filter :find_earning, :only => [:show, :edit, :update, :destroy]

  def new
  	@earning = @stock.earnings.build
  end

  def create
  	#binding.pry
  	@earning = @stock.earnings.build(params[:earning])
  	 if @earning.save
  	  flash[:notice] = "Earnings Saved."
  	  redirect_to [@stock, @earning]
  	 else
  	 	flash[:notice] = "Earnings not Saved."
  	 	render :action => "new"
  	 end
  end

  def update
  	#binding.pry
  end

  def edit
  	#binding.pry

  end
  
  def show
  end

  def index
  	#puts params
  	#@earnings = @stock.earnings.find(params[:id])
  	#binding.pry
  end

  def destroy
    @earning.destroy
    flash[:notice] = "Earning has been deleted."
    redirect_to @stock
  end

private
   def find_stock
    @stock = Stock.find(params[:stock_id])
   end
   
   def find_earning
    @earning = @stock.earnings.find(params[:id])
   end

end
