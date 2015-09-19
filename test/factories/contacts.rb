FactoryGirl.define do
  factory :contact do
    name { FFaker::NameRU.name }
    phone { FFaker::PhoneNumber.phone_number }
    email { FFaker::Internet.email }
    organization { FFaker::Company.name }
    position { FFaker::Lorem.word }
  end
end
