class AddJobsToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :prescription_collection, :boolean
    add_column :volunteers, :snow_clearance, :boolean
    add_column :volunteers, :grit_spreading, :boolean
    add_column :volunteers, :dog_walking, :boolean
  end
end
