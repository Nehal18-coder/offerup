class Furniture < ApplicationRecord
  mount_base64_uploader :photo, PhotoUploader

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
