class ClientsController < AuthenticatedController
  def create
    @clients = Client.new(client_params)
    @clients.user = User.find(session[:user_id]) if session[:user_id]
    if @clients.save
      redirect_to clients_url
    else
      puts @clients.errors.full_messages
      render :new
    end
  end

  def index
    @clients = Client.where(user_id: session[:user_id])
  end

  def new
    @clients = Client.new
    @stock = Stock.where(user_id: session[:user_id])
  end

  def destroy
    @clients = Client.find(params[:id])
    @clients.destroy
    redirect_to clients_url
  end

  private

  def client_params
    params.require(:client).permit(:name, :user_id)
  end
end
