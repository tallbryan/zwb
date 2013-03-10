class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end
  
  def create
    @portfolio = Portfolio.new (params[:portfolio])
    if @portfolio.save
      flash[:notice] = "Your portfolio has been created'"
      redirect_to @portfolio
    else
      render 'new'
      flash[:notice] = "Nane can't be blanck"      
      # I think add this to make the test pass
    end
  end
  
  def show
    @portfolio = Portfolio.find(params[:id])
  end
end
