class AddIndexToWithinPerimeters < ActiveRecord::Migration
  def change
  	add_index :within_perimeters, :zipcode_id
  end
end
