class AddVolunteerIdToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :volunteer, index: true
    add_foreign_key :tasks, :volunteers
  end
end
