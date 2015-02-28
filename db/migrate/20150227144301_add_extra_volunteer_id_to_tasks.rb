class AddExtraVolunteerIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :volunteer_two_id, :integer
    add_index :tasks, :volunteer_two_id
    add_column :tasks, :volunteer_three_id, :integer
    add_index :tasks, :volunteer_three_id
  end
end
