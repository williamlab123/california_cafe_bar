class SalesController < AuthenticatedController


  def create
    stock = Stock.find(params[:sale][:stock_id])
    @sale = Sale.new(sale_params.merge(stock: stock))
    if @sale.save
      redirect_to @sale, notice: 'Sale was successfully created.'
    else
      Rails.logger.debug @sale.errors.full_messages
      render :new
    end
  end

  def index
    @sales = Sale.includes(:stock)
  end

  def new
    @sale = Sale.new
    @stock = Stock.where(user_id: session[:user_id])
  end

  def show; end

  def edit
    @sale = Sale.find(params[:id])
  end

  def download_recipe
    sale = Sale.find(params[:id])
    recipe = sale.recipe.recipe_note
    send_data recipe, filename: "recipe_#{sale.id}.txt"
  end

  private

  def sale_params
    params.require(:sale).permit(:stock_id, :quantity)
  end
  
end
