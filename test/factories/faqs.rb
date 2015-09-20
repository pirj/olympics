FactoryGirl.define do
  factory :faq do
    question { FFaker::Lorem.paragraph }
    answer { FFaker::Lorem.paragraph }
  end
end
