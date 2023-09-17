# frozen_string_literal: true

API_KEY = ENV['CLOUDINARY_API_KEY']
API_SECRET = ENV['CLOUDINARY_API_SECRET']
CLOUD_NAME = ENV['CLOUDINARY_CLOUD_NAME']

Cloudinary.config do |config|
  config.secure = true
  config.cloud_name = CLOUD_NAME
  config.api_key = API_KEY
  config.api_secret = API_SECRET
end
