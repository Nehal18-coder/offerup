class AddUserReferenceToFurnitures < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :furnitures, :users
    add_index :furnitures, :user_id
    change_column_null :furnitures, :user_id, false
  end
end
