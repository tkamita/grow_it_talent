class Public::SalesController < ApplicationController
  before_action :authenticate_corporation!

  def index
    @sales = current_corporation.sales
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to public_sales_path
    else
      @sales = current_corporation.sales
      render :index
    end
  end

  def update
    @sale = Sale.find(params[:id])
    if sale.update(sale_params)
      redirect_to public_sales_path
    else
      @sales = current_corporation.sales
      @sale = Sale.new
      render :index
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to public_sales_path
  end

  private
  def sale_params
    params.require(:sale).permit(:corporation_id, :year_sales, :financial_year)
  end
end
