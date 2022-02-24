# We have to set CarrierWave cache_storage to :file
# in order to upload files to cloudinary storage.

CarrierWave.configure do |config|
  config.cache_storage = :file
end
