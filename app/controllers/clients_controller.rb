class ClientsController < ApplicationController

  before_action :authenticate_admin!
  def index
    if params[:search]
      @clients = Client.search(params[:search]).order('last_name ASC')
    else
      @clients = Client.all.order('last_name ASC')
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to '/pages'
      flash[:notice] = "Client successfully added"
    else
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to '/pages'
    else
      flash[:notice] = "Invalid Post Code"
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = 'Client deleted successfully'
    redirect_to '/pages'
  end

  private

  def client_params
    params.require(:client).permit(:name, :last_name, :address, :postcode, :phone)
  end

end
