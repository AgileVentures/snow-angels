class AddTaskIdToMatchTaskVolunteers < ActiveRecord::Migration
  def change
    add_reference :match_task_volunteers, :task, index: true
    add_foreign_key :match_task_volunteers, :tasks
  end
end
