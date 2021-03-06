class StatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :furniture_id, :integer

  # Direct associations

  has_many :furnitures

  # Indirect associations
end
