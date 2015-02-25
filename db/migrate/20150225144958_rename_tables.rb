class RenameTables < ActiveRecord::Migration
  def change
    rename_table :sms, :texts
  end
end
