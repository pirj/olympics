FactoryGirl.define do
  factory :news do
    title { FFaker::Lorem.words(3) }
    text { FFaker::Lorem.paragraph }
    association :author, factory: :user
  end
end
