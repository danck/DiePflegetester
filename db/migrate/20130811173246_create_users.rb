class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :alias
      t.string :name
      t.string :email
      t.string :role, default: "benutzer"

      t.timestamps
    end
  end
end
