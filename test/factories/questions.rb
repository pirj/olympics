FactoryGirl.define do
  factory :question do
    title { FFaker::Lorem.paragraph }
    questionnaire

    transient do
      answers_count 2
    end

    after(:create) do |question, evaluator|
      create_list :answer, evaluator.answers_count, question: question
    end
  end
end
