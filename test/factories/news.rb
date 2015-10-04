FactoryGirl.define do
  factory :news do
    title { FFaker::Lorem.phrase }
    text { FFaker::Lorem.paragraph }
    association :author, factory: :user
    category
  end
end
