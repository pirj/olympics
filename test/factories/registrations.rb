FactoryGirl.define do
  factory :registration do
    email { FFaker::Internet.email }
    name { FFaker::NameRU.name }
    note { FFaker::Lorem.paragraph }
  end
end
