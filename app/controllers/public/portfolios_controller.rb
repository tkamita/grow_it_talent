class Public::PortfoliosController < ApplicationController


  def show
    @portfolio = Portfolio.find(params[:id])
  end


  def index
    @portfolios = Portfolio.all.order(created_at: :desc)
  end
  
  private
end
