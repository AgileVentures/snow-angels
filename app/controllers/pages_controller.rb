class PagesController < ApplicationController

  def index
    @available = Volunteer.where(availability: true)
    @tasks_to_be_assigned = Task.to_be_assigned
    @assigned_tasks = Task.assigned
    @completed_tasks = Task.done
    @matches = MatchTaskVolunteer.all
  end

end
