FactoryGirl.define do
  factory :questionnaire do
    title { FFaker::Lorem.paragraph }
    starts_on { FFaker::Time.date }
    ends_on { FFaker::Time.date }

    transient do
      answers_count 2
    end

    after(:create) do |questionnaire, evaluator|
      create_list :answer, evaluator.answers_count, questionnaire: questionnaire
    end
  end
end
