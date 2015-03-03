class MatchTaskVolunteersController < ApplicationController

  def match
    @text = Text.new
    @task = Task.find(params[:id])
    @volunteers = order_by_dbs(available_volunteers)

    if @volunteers.any?
      @volunteers.each do |volunteer|
        MatchTaskVolunteer.create(volunteer_id: volunteer.id, task_id: @task.id)
      end
    else
      no_match
    end
  end

  def available_volunteers
    Volunteer.where(availability: true)
  end

  def order_by_dbs(volunteers)
    volunteers.order(dbs: :desc).take(3)
  end

  def no_match
    flash[:notice] = 'There are no more unmatched volunteers'
  end
end