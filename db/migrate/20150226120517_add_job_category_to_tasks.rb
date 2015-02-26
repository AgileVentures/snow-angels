class AddJobCategoryToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :category, :string
    add_column :tasks, :description, :text
  end
end
