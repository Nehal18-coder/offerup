class AddGoogleMapLongitudeToFurniture < ActiveRecord::Migration[6.0]
  def change
    add_column :furnitures, :google_map_longitude, :float
  end
end
