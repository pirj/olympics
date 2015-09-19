FactoryGirl.define do
  factory :event do
    title { FFaker::Lorem.phrase }
    description { FFaker::Lorem.paragraph }
    start { Date.current }
    finish { Date.current }
    subtype { Event.subtype.values.sample }
    association :author, factory: :user
    association :owner, factory: :user
    external false
  end
end
