class User::PortfoliosController < ApplicationController

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

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def index
    @portfolios = Portfolio.all
  end
  
  private
  def portfolio_params
    params.require(:portfolio).permit(:applicant_id, :pg_lang_id, :title, :content, :theme,
                                      :reason, :target, :scene, :link_url)
  end
end
