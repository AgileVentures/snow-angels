class ClientsController < ApplicationController

  before_action :authenticate_admin!
  before_action only: [:edit, :update, :destroy] { @client = find_client(params) }

  def index
    if params[:search]
      @clients = Client.search(params[:search]).ordered_by_last_name
    else
      @clients = Client.all.ordered_by_last_name
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
      flash[:notice] = "Client successfully added"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to pages_path
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    flash[:notice] = 'Client deleted successfully'
    redirect_to pages_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :last_name, :address, :postcode, :phone)
  end

  def find_client(params)
    Client.find(params[:id])
  end

end
