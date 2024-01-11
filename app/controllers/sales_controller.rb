class SalesController < AuthenticatedController
  def create
    stock = Stock.find(params[:sale][:stock_id])
    @sale = Sale.new(sale_params.merge(stock: stock, user: current_user))
  
    if @sale.save
      redirect_to @sale, notice: 'Sale was successfully created.'
    else
      Rails.logger.debug @sale.errors.full_messages
      render :new
    end
  end
  def index
    @sales = Sale.includes(:stock, :client).where(user_id: session[:user_id])
  end

  def new
    @sale = Sale.new
    @stock = Stock.where(user_id: session[:user_id])
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  private

  def sale_params
    params.require(:sale).permit(:client_id, :stock_id, :quantity)
  end
end
