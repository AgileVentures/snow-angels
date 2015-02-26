class AddColumnsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :task_type, :string
    add_column :tasks, :description, :text
  end
end
