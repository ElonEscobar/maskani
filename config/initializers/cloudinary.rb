require 'cloudinary'
require 'dotenv/load'

Cloudinary.config_from_url("cloudinary://#{ENV['CLOUD_API_KEY']}:#{ENV['CLOUD_API_SECRET']}@#{ENV['CLOUD_NAME']}")
Cloudinary.config do |config|
    config.secure = true
end