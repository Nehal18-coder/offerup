class AddGoogleMapFormattedAddressToFurniture < ActiveRecord::Migration[6.0]
  def change
    add_column :furnitures, :google_map_formatted_address, :string
  end
end
