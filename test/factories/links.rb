FactoryGirl.define do
  factory :link do
    title { FFaker::Lorem.phrase }
    url { FFaker::Internet.uri 'http' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'fixtures', 'image.png'), 'image/png') }
  end
end
