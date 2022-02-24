class AddStatusReferenceToFurnitures < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :furnitures, :statuses
    add_index :furnitures, :status_id
    change_column_null :furnitures, :status_id, false
  end
end
