class MatchTaskVolunteersController < ApplicationController

before_action :authenticate_admin!

  def match
    @task = Task.find(params[:id])
    @volunteers = Volunteer.available.first_three_dbs
    @volunteers.any? ? build_join(@volunteers, @task) : no_match
    redirect_to task_path
  end

  def no_match
    flash[:notice] = 'There are no more unmatched volunteers'
  end

  def build_join(volunteers, task)
    volunteers.each do |volunteer|
      MatchTaskVolunteer.create(volunteer_id: volunteer.id, task_id: task.id)
    end
  end
end