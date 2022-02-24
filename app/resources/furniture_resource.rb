class FurnitureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :photo, :string
  attribute :category, :string
  attribute :price, :float
  attribute :google_map, :string
  attribute :user_id, :integer
  attribute :status_id, :integer

  # Direct associations

  # Indirect associations

end
