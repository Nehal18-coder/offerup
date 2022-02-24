class CreateFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :furnitures do |t|
      t.text :title
      t.string :photo
      t.text :category
      t.float :price
      t.string :google_map
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
