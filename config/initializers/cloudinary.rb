Cloudinary.config do |config|
  config.cloud_name = ENV["CLOUDINARY_CLOUD_NAME"]
  config.api_key = ENV["CLOUDINARY_API_KEY"]
  config.api_secret = ENV["CLOUDINARY_API_SECRET"]
  config.cdn_subdomain = true
end

# Sign up for a free account at Cloudinary.com.

# Create a file called .env in the root folder of your application.

# Add the following lines to it:

# CLOUDINARY_CLOUD_NAME=<your cloud name>
# CLOUDINARY_API_KEY=<your api key>
# CLOUDINARY_API_SECRET=<your api secret>

# You can find the values in your Cloudinary dashboard.
