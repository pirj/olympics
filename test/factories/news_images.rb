FactoryGirl.define do
  factory :news_image do
    news
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'fixtures', 'image.png'), 'image/png') }
  end
end
