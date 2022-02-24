class Furniture < ApplicationRecord
  # Direct associations

  belongs_to :status

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    id
  end

end
