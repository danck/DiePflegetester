class CreatePflegeberaters < ActiveRecord::Migration
  def change
    create_table :pflegeberaters do |t|
      t.string :name

      t.timestamps
    end
  end
end
