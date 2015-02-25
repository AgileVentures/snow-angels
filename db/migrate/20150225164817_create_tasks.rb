class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :volunteer_text_confirmed
      t.boolean :called_client
      t.boolean :task_done

      t.timestamps null: false
    end
  end
end
