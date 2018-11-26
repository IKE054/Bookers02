class AddDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :users, :name, false
  	add_index :users, :name, unique: true
  end
end
