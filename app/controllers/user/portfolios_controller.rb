class User::PortfoliosController < ApplicationController
  before_action :authenticate_applicant!

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to user_portfolio_path(@portfolio)
    else
      render :new
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to user_portfolio_path(@portfolio)
    else
      render :show
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to user_portfolios_path
  end

  def index
    @portfolios = current_applicant.portfolios
  end
  
  private
  def portfolio_params
    params.require(:portfolio).permit(:applicant_id, :pg_lang_id, :title, :content, :theme,
                                      :reason, :target, :scene, :link_url)
  end
end
