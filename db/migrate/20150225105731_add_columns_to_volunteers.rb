class AddColumnsToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :post_code, :text
    add_column :volunteers, :last_name, :text
  end
end
