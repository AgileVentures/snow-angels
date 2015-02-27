class AddDbsToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :dbs, :boolean
  end
end
