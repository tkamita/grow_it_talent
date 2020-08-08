unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAX6XKGJBVDSBIQAZO',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory = 'grow-it-talent'
    config.cache_storage = :fog
  end
end