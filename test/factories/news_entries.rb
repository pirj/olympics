FactoryGirl.define do
  factory :news_entry do
    title { FFaker::Lorem.words(3) }
    text { FFaker::Lorem.paragraph }
    association :author, factory: :user
  end
end
