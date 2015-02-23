class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    Client.create(client_params)
    redirect_to '/pages'
  end

  private

  def client_params
    params.require(:client).permit(:name, :last_name, :address, :postcode, :phone)
  end

end
