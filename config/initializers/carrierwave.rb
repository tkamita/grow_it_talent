unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_KEY'],
      region: ENV['REGION']
    }

    config.fog_directory = ENV['S3_BUCKET']
    config.cache_storage = :fog
    config.asset_host = ENV['CLOUD_FRONT']
  end
end