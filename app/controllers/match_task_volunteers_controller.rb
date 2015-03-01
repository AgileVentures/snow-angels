class MatchTaskVolunteersController < ApplicationController

  def match
    @available = Volunteer.where(availability: true)
    @match = MatchTaskVolunteer.new
    @available_dbs = Volunteer.where(availability: true, dbs: true)
    if @available_dbs.any?
      @match.update(volunteer_id: @available_dbs.first.id )
      @available_dbs.first.update(availability: false)
      if @available_dbs.any?
        @match.update(volunteer_id: @available_dbs.first.id )
      elsif @available.any?
        @match.update(volunteer_id: @available.first.id)
      else
        flash[:notice] = "There are no more unmatched volunteers"
      end
    elsif @available.any?
      @match.update(volunteer_id: @available.first.id)
      @available.first.update(availability: false)
      if @available.any?
        @match.update(volunteer_id: @available.first.id)
      else 
        flash[:notice] = "There are no more unmatched volunteers"
      end
    else
      flash[:notice] = "There are no more unmatched volunteers"
    end
    redirect_to pages_path
  end

end
