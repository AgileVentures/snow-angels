class AddMobileToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :mobile, :text
  end
end
