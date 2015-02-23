class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.text :address
      t.string :mobile_number

      t.timestamps null: false
    end
  end
end
