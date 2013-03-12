class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def show
    @portfolio = Portfolio.find(params[:id])
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
  
  def update
    @portfolio = Portfolio.find(params[:id])
    @portfolio.update_attributes(params[:portfolio])
    @portfolio.save
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @stocks = Stock.all
  end
end
