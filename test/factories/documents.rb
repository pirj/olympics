FactoryGirl.define do
  factory :document do
    title { FFaker::Lorem.phrase }
    text { FFaker::Lorem.paragraph }
    subtype { Document.subtype.values.sample }
    attached_document { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'fixtures', 'doc.pdf'), 'application/pdf') }
  end
end
