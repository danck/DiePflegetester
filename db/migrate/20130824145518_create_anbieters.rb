class CreateAnbieters < ActiveRecord::Migration
  def change
    create_table :anbieters do |t|
      t.string :name
      t.integer :contact_data_id

      t.timestamps
    end
  end
end
