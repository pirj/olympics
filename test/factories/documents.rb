FactoryGirl.define do
  factory :document do
    title { FFaker::Lorem.phrase }
    text { FFaker::Lorem.paragraph }
    subtype { Document.subtype.values.last }
    # FIXME: username??
    attached_document_id { FFaker::Internet.user_name }
  end
end
