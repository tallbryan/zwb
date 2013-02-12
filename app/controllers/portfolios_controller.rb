class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end
  
  def create
    @portfolio = Portfolio.new (params[:portfolio])
    if @portfolio.save
      flash[:notice] = "Portfolio has been created"
      flash[:notice] = "#{@portfolio.name}"
      redirect_to @portfolio
    else
      #nothing, yet
    end
  end
  
  def show
    @portfolio = Portfolio.find(params[:id])
  end
end
