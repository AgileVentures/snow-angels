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

  def volunteer_params
    params.require(:volunteer).permit(:name, :address, :mobile_number)
  end

end
