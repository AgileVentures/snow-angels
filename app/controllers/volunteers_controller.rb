class VolunteersController < ApplicationController

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

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :last_name, :address, :post_code, :mobile_number)
  end

end
