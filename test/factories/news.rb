FactoryGirl.define do
  factory :news do
    title { FFaker::Lorem.phrase }
    text { FFaker::Lorem.paragraph }
    association :author, factory: :user
    department { News.department.values.last }
  end
end
