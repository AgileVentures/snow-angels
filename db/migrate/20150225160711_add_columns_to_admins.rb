class AddColumnsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :address, :text
    add_column :admins, :post_code, :text
    add_column :admins, :first_name, :text
    add_column :admins, :last_name, :text
  end
end
