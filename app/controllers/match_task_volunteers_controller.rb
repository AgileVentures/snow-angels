class MatchTaskVolunteersController < ApplicationController

  def match
    @task = Task.find(params[:id])
    @available = Volunteer.where(availability: true)
    @available_dbs = Volunteer.where(availability: true, dbs: true)
    if @available_dbs.any?
      @match = MatchTaskVolunteer.create(volunteer_id: @available_dbs.first.id, task_id: @task.id)
      @available_dbs.first.update(availability: false)
      if @available_dbs.any?
        @match_two = MatchTaskVolunteer.create(volunteer_id: @available_dbs.first.id, task_id: @task.id)
        @available_dbs.first.update(availability: false)
      elsif @available.any?
        @match_two = MatchTaskVolunteer.create(volunteer_id: @available.first.id, task_id: @task.id)
        @available.first.update(availability: false)
      else
        flash[:notice] = "There are no more unmatched volunteers"
      end
    elsif @available.any?
      @match = MatchTaskVolunteer.create(volunteer_id: @available.first.id, task_id: @task.id)
      @available.first.update(availability: false)
      if @available.any?
        @match_two = MatchTaskVolunteer.create(volunteer_id: @available.first.id, task_id: @task.id)
        @available.first.update(availability: false)
      else
        flash[:notice] = "There are no more unmatched volunteers"
      end
    else
      flash[:notice] = "There are no more unmatched volunteers"
    end
    redirect_to pages_path
  end

end
