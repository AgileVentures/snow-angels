class AdminsController < ApplicationController

  def index
      @admin = Admin.all
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    flash[:notice] = "The Admin has been deleted"
    redirect_to admins_path
  end

  def edit
    @admin = Admin.find(params[:id])
  end

end
