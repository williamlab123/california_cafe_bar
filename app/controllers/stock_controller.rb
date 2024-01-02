# app/controllers/stocks_controller.rb
class StockController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to new_stock_path
    else
      render :new
    end
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.all
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :user_id)
  end
end
