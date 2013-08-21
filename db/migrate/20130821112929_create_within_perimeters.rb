class CreateWithinPerimeters < ActiveRecord::Migration
  def change
    create_table :within_perimeters do |t|
      t.integer :zipcode_id
      t.integer :neighbor
      t.integer :distance

      t.timestamps
    end
  end
end