FactoryGirl.define do
  factory :answer do
    title { FFaker::Lorem.paragraph }
    questionnaire

    transient do
      votes_count 2
    end

    after(:create) do |answer, evaluator|
      create_list :vote, evaluator.votes_count, answer: answer
    end
  end
end
