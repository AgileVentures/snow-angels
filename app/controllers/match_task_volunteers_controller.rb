class MatchTaskVolunteersController < ApplicationController

before_action :authenticate_admin!

  def match
    @task = Task.find(params[:id])
    @volunteers = Volunteer.available.first_three_dbs

    if @volunteers.any?
      @volunteers.each do |volunteer|
        MatchTaskVolunteer.create(volunteer_id: volunteer.id, task_id: @task.id)
        volunteer.availability = false
        volunteer.save
      end
      redirect_to task_path
    else
      no_match
    end
  end

  def no_match
    flash[:notice] = 'There are no more unmatched volunteers'
  end
end