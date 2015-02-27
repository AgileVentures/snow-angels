class SettingsController < ApplicationController

  before_action :authenticate_admin!
  def index 
  end

  def email
    @emails = Volunteer.pluck(:email)
  end

end
