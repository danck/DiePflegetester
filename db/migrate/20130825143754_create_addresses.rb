class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street_number
      t.integer :zipcode_id
      t.string :city

      t.timestamps
    end
  end
end
