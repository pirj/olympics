FactoryGirl.define do
  factory :event do
    title { FFaker::Lorem.phrase }
    description { FFaker::Lorem.paragraph }
    excercise { FFaker::Lorem.paragraph }
    resolution { FFaker::Lorem.paragraph }
    start { Date.current }
    finish { Date.current }
    subtype { Event.subtype.values.sample }
    subject
    association :author, factory: :user
    association :owner, factory: :contact
    external false
  end
end
