FactoryGirl.define do
  factory :subject do
    title { FFaker::Lorem.phrase }
  end
end
