FactoryGirl.define do
  factory :event_document do
    event
    section { EventDocument.section.values.sample }
    title { FFaker::Lorem.phrase }
    attached_document { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'fixtures', 'doc.pdf'), 'application/pdf') }
  end
end
