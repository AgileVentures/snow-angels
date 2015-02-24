class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.text :address
      t.string :postcode
      t.string :phone

      t.timestamps null: false
    end
  end
end
