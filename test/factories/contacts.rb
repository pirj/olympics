FactoryGirl.define do
  factory :contact do
    event
    name { FFaker::NameRU.name }
    phone { FFaker::PhoneNumber.phone_number }
    additional_phone { FFaker::PhoneNumber.phone_number }
    email { FFaker::Internet.email }
    organization { FFaker::Company.name }
    position { FFaker::Lorem.word }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'fixtures', 'image.png'), 'image/png') }
  end
end
