class ResetVolunteerAvailability < ActiveRecord::Base

  def ResetVolunteerAvailability.reset
    Volunteer.update_all(availability: nil)
  end

end
