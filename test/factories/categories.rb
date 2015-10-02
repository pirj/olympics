FactoryGirl.define do
  factory :category do
    title { FFaker::Lorem.phrase }
    department { Category.department.values.sample }
  end
end
