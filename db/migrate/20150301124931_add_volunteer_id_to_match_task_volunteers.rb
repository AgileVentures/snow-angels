class AddVolunteerIdToMatchTaskVolunteers < ActiveRecord::Migration
  def change
    add_reference :match_task_volunteers, :volunteer, index: true
    add_foreign_key :match_task_volunteers, :volunteers
  end
end
