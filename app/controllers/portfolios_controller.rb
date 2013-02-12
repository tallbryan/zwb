class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end
end
