class VolunteersController < ApplicationController
  def index

  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
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

  def volunteer_params
    params.require(:volunteer).permit(:name, :address, :mobile_number)
  end

end
