class PagesController < ApplicationController

  def index
    @available = Volunteer.where(availability: true)
    @tasks_to_be_assigned = Task.to_be_assigned
    @completed_tasks = Task.done
    @assigned_tasks = Task.assigned
    @matches = MatchTaskVolunteer.all
  end

end
