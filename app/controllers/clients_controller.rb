class ClientsController < ApplicationController
  def create
    @clients = Client.new(client_params)
    @clients.user = User.find(session[:user_id]) if session[:user_id]
    if @clients.save
      redirect_to @clients
    else
      puts @clients.errors.full_messages
      render :new
    end
  end

  def index
    @clients = Client.all
  end

  def new
    @clients = Client.new
    @stock = Stock.all
  end

  private

  def client_params
    params.require(:client).permit(:name, :user_id)
  end
end
