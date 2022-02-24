class Status < ApplicationRecord
  # Direct associations

  has_many   :furnitures,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    furniture_id
  end

end
