class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    Client.create(client_params)
    flash[:notice] = "Client successfully added"
    redirect_to '/pages'
  end

  def show
    @client = Client.find(params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:name, :last_name, :address, :postcode, :phone)
  end

end
