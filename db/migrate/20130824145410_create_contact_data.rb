class CreateContactData < ActiveRecord::Migration
  def change
    create_table :contact_data do |t|
      t.string :address_id
      t.string :phone_number

      t.timestamps
    end
  end
end