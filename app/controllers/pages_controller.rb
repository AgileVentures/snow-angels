class PagesController < ApplicationController

  def index
    @available = Volunteer.where(availability: true)
  end

end
