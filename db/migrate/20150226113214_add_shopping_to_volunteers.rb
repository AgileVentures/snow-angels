class AddShoppingToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :shopping, :boolean
  end
end
