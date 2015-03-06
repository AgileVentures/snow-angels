class VolunteersController < ApplicationController

  before_action :authenticate_admin!, except: [:new, :create]
  before_action except: [:index, :new, :create] { @volunteer = find_volunteer(params) }

  def index
    if params[:search]
      @volunteer = Volunteer.search(params[:search]).ordered_by_last_name
    else
      @volunteer = Volunteer.all.ordered_by_last_name
    end
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.mobile_number = Volunteer.internationalize_phone_number(@volunteer.mobile_number)
    if @volunteer.save
      redirect_to pages_path
      flash[:notice] = "Thank you for your registration"
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @volunteer.update(volunteer_params)
      redirect_to volunteers_path
    else
      render 'edit'
    end
  end

  def destroy
    @volunteer.destroy
    flash[:notice] = "The volunteer has been deleted"
    redirect_to volunteers_path
  end

  def available
    @volunteer.update(availability: true)
    redirect_to texts_path
  end

  def unavailable
    @volunteer.update(availability: false)
    redirect_to texts_path
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :last_name, :address, :post_code, :mobile_number, :email, :shopping, :prescription_collection, :snow_clearance, :grit_spreading, :dog_walking, :dbs)
  end

  def find_volunteer(params)
    Volunteer.find(params[:id])
  end

end
