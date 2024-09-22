# app/controllers/stocks_controller.rb

class StocksController < AuthenticatedController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params.merge(user: current_user))
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

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to stocks_path
  end

  def edit
    @stock = Stock.find(params[:id])
  end

 def update
  @stock = Stock.find(params[:id])

  if @stock.update(stock_params)
    redirect_to @stock, notice: 'Stock was successfully updated.'
  else
    render :edit
  end
end

  private

  def stock_params
    params.require(:stock).permit(:name, :amount, :price, :barcode)
  end
end
