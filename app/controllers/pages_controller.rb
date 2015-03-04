class PagesController < ApplicationController

  def index
    @tasks_to_be_assigned = Task.to_be_assigned.todays_tasks
    @assigned_tasks = Task.assigned.todays_tasks
    @completed_tasks = Task.done.todays_tasks
  end

end
