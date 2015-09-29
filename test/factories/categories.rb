FactoryGirl.define do
  factory :category do
    title { FFaker::Lorem.phrase }
    subtype { Category.subtype.values.sample }
  end
end
