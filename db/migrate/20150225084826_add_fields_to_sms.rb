class AddFieldsToSms < ActiveRecord::Migration
  def change
    add_column :sms, :number, :string
    add_column :sms, :body, :text
  end
end
