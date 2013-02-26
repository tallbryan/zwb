class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
  
  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new (params[:portfolio])
    if @portfolio.save
      flash[:notice] = "Your portfolio has been created'"
      redirect_to @portfolio
    else
      #nothing, yet
    end
  end
  
  def show
    @portfolio = Portfolio.find(params[:id])
  end
end
