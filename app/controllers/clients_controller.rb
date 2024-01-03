class ClientsController < ApplicationController

  def create
    @client = Client.new(client_params)
    @client.user = User.find(session[:user_id]) if session[:user_id]
    if @client.save
      redirect_to @client
    else
      puts @client.errors.full_messages
      render :new
    end
  end

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @stock = Stock.all
  end

  private

  def client_params
    params.require(:client).permit(:name) # replace :name, :email with your actual client attributes
  end
end
