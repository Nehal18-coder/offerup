require "open-uri"
class Furniture < ApplicationRecord
  before_validation :geocode_google_map

  def geocode_google_map
    if google_map.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(google_map)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.google_map_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.google_map_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.google_map_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
