class SettingsController < ApplicationController

  def index 
  end

  def email
    @emails = Volunteer.pluck(:email)
  end

end
