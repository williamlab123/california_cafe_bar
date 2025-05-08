# app/controllers/stocks_controller.rb

class StocksController < AuthenticatedController
  def new
    @stock = Stock.new
  end

  def create
    # Assign default barcode if the field is left blank
    default_barcode = "DEFAULT_BARCODE_#{SecureRandom.hex(3)}"
    @stock = Stock.new(stock_params.merge(user: current_user, barcode: stock_params[:barcode].presence || default_barcode))
  
    if @stock.save
      redirect_to new_stock_path, notice: 'Stock created successfully.'
    else
      logger.debug "Stock creation failed: #{@stock.errors.full_messages}"
      render :new
    end
  end

  def amount
    stock = Stock.find(params[:id])
    render json: { amount: stock.amount }
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
    params.require(:stock).permit(:name, :amount, :price, :barcode, :is_salgado)
  end
end
