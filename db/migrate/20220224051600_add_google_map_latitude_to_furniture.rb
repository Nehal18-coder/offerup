class AddGoogleMapLatitudeToFurniture < ActiveRecord::Migration[6.0]
  def change
    add_column :furnitures, :google_map_latitude, :float
  end
end
