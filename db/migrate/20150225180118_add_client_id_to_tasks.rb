class AddClientIdToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :client, index: true
    add_foreign_key :tasks, :clients
  end
end
