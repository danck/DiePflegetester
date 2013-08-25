class CreateContactData < ActiveRecord::Migration
  def change
    create_table :contact_data do |t|
      t.integer :address_id
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end