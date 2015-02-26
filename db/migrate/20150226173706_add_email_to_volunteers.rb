class AddEmailToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :email, :string
  end
end
