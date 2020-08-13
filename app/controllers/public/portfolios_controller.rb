class Public::PortfoliosController < ApplicationController
  before_action :authenticate_corporation!

  def show
    @portfolio = Portfolio.find(params[:id])
  end


  def index
    @portfolios = Portfolio.all.order(created_at: :desc)
  end
  
  def specific_index
    @applicant = Applicant.find(params[:id])
    if params[:pg_lang_id].present?
      @portfolios = PgLang.find(params[:pg_lang_id]).portfolios
    else
      @portfolios = @applicant.portfolios
    end
  end
end
