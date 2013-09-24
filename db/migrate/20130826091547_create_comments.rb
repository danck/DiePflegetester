class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :anbieter_id
      t.integer :user_id
      t.integer :rating
      t.boolean :published
      t.boolean :validated

      t.timestamps
    end
  end
end