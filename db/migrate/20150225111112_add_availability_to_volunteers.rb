class AddAvailabilityToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :availability, :boolean
  end
end
