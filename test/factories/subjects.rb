FactoryGirl.define do
  factory :subject do
    title { FFaker::Lorem.word }
    department { Subject.department.values.last }
  end
end
