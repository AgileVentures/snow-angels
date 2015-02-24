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

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      redirect_to volunteer_path(@volunteer)
      flash[:notice] = "Thank you for updated registration"
    else
      render 'new'
    end
  end

  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy
    flash[:notice] = "The volunteer has been deleted"
    redirect_to '/volunteers'
  end

end
