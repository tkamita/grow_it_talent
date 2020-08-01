class Public::PortfoliosController < ApplicationController


  def show
    @portfolio = Portfolio.find(params[:id])
  end


  def index
    @portfolios = Portfolio.all.order(created_at: :desc)
  end
  
  def specific_index
    @applicant = Applicant.find(params[:id])
    @portfolios = @applicant.portfolios
  end
end