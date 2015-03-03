class VolunteersController < ApplicationController

  before_action :authenticate_admin!, except: [:new, :create]

  def index
    if params[:search]
      @volunteer = Volunteer.search(params[:search]).order('last_name ASC')
    else
      @volunteer = Volunteer.all.order('last_name ASC')
    end
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.mobile_number = Volunteer.internationalize_phone_number(@volunteer.mobile_number)
    if @volunteer.save
      redirect_to volunteer_path(@volunteer)
      flash[:notice] = "Thank you for your registration"
    else
      render 'new'
    end
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update(volunteer_params)
      redirect_to volunteers_path
    else
      render 'edit'
    end
  end

  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy
    flash[:notice] = "The volunteer has been deleted"
    redirect_to '/volunteers'
  end

  def available
    @volunteer = Volunteer.find(params[:id])
    @volunteer.update(availability: true)
    redirect_to texts_path
  end

  def unavailable
    @volunteer = Volunteer.find(params[:id])
    @volunteer.update(availability: false)
    redirect_to texts_path
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :last_name, :address, :post_code, :mobile_number, :email, :shopping, :prescription_collection, :snow_clearance, :grit_spreading, :dog_walking, :dbs)
  end

end
