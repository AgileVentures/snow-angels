class PagesController < ApplicationController

  def index
    @available = Volunteer.where(availability: true)
    @tasks = Task.all
  end

end
