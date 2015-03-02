class CreateMatchTaskVolunteers < ActiveRecord::Migration
  def change
    create_table :match_task_volunteers do |t|

      t.timestamps null: false
    end
  end
end
