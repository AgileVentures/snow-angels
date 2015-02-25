class AddVolunteerIdToSms < ActiveRecord::Migration
  def change
    add_reference :sms, :volunteer, index: true
    add_foreign_key :sms, :volunteers
  end
end
