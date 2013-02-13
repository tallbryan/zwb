class EarningsController < ApplicationController

 before_filter :find_stock
 before_filter :find_earning, :only => [:show, :edit, :update, :destroy]

  def new
    @earning = @stock.earnings.build
  end

  def create
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
  	if @earning.update_attributes(params[:earning])
    flash[:notice] = "Earnings have been updated."
    redirect_to [@stock, @earning]
   else
    flash[:alert] = "Earnings have not been updated."
    render :action => "edit"
   end
  end

  def edit
  end
  
  def index
  end

  def show
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
    @earning = @stock.earnings(params[:id])
   end

end
