class MatchTaskVolunteersController < ApplicationController

  def match
    @task = Task.find(params[:id])
    @available = Volunteer.where(availability: true)
    @dbs = Volunteer.where(dbs: true)

    if @available.any? && @dbs.any?
      @match = MatchTaskVolunteer.create(volunteer_id: @dbs.first.id, task_id: @task.id)
      @dbs.first.update(availability: false)

      if @available.any? && @dbs.second
        @match_two = MatchTaskVolunteer.create(volunteer_id: @dbs.second.id, task_id: @task.id)
        @dbs.second.update(availability: false)

        if @available.any? && @dbs.third
          @match_three = MatchTaskVolunteer.create(volunteer_id: @dbs.third.id, task_id: @task.id)
          @dbs.third.update(availability: false)
        elsif @available.any?
          @match_three = MatchTaskVolunteer.create(volunteer_id: @available.first.id, task_id: @task.id)
          @available.first.update(availability: false)
        else
          flash[:notice] = "There are no more unmatched volunteers"
        end

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
        @match_two = MatchTaskVolunteer.create(volunteer_id: @available.second.id, task_id: @task.id)
        @available.second.update(availability: false)

        if @available.any?
          @match_three = MatchTaskVolunteer.create(volunteer_id: @available.third.id, task_id: @task.id)
          @available.third.update(availability: false)
        else
          flash[:notice] = "There are no more unmatched volunteers"
        end

      else
        flash[:notice] = "There are no more unmatched volunteers"
      end

    else
      flash[:notice] = "There are no more unmatched volunteers"
    end
    redirect_to pages_path
  end

end
