require 'test_helper'

describe Event do
  describe 'basic' do
    subject { build :event }

    it 'must have fields and associations' do
      must belong_to(:author).class_name 'User'
      must belong_to(:owner).class_name 'Contact'
      must belong_to(:subject)
      must have_many(:contacts).through :contacts_events
      must have_many(:documents).class_name 'EventDocument'
      must have_db_column :title
      must have_db_column :description
      must have_db_column :start
      must have_db_column :finish
      must have_db_column :subtype
      must have_db_column :author_id
      must have_db_column :owner_id
      must have_db_column :external
      must have_db_column :aasm_state
    end

    it 'validates attributes' do
      must have_valid(:title).when('asd  asd asd ')
      wont have_valid(:title).when(nil, '')
      must have_valid(:description).when('asd  asd asd ')
      wont have_valid(:description).when(nil, '')
      must have_valid(:start).when(Date.current)
      wont have_valid(:start).when(nil, '')
      must have_valid(:finish).when(Date.current)
      wont have_valid(:finish).when(nil, '')
      must have_valid(:subtype).when(:federal, :regional, :rsosh, :science)
      wont have_valid(:subtype).when(nil, '', :lol)
      must validate_inclusion_of(:subtype).in_array %w(federal regional rsosh science)
      must validate_inclusion_of(:aasm_state).in_array %w(draft published archived)
    end
  end

  describe 'scope' do
    before do
      create :event, aasm_state: 'draft'
      create :event, aasm_state: 'published'
      create :event, aasm_state: 'archived'
    end

    describe 'draft only' do
      subject { Event.draft }

      it 'fits the scope' do
        assert_equal subject.map(&:draft?), [ true ]
      end
    end

    describe 'published only' do
      subject { Event.published }

      it 'fits the scope' do
        assert_equal subject.map(&:published?), [ true ]
      end
    end

    describe 'archived only' do
      subject { Event.archived }

      it 'fits the scope' do
        assert_equal subject.map(&:archived?), [ true ]
      end
    end
  end
end
