class User < ApplicationRecord
  # Direct associations

  has_many   :furnitures,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    id
  end
end
