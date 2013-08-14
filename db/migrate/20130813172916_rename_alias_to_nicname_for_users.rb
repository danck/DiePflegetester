class RenameAliasToNicnameForUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :alias, :nicname
  end
end