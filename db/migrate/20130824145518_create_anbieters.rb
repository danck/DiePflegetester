class CreateAnbieters < ActiveRecord::Migration
  def change
    create_table :anbieters do |t|
      t.integer :zipcode_id
      t.string :name
      t.string :street
      t.string :street_number
      t.string :city
      t.string :phone_number

      t.timestamps
    end
  end
end
