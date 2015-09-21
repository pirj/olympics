require 'test_helper'

describe Event do
  describe 'basic' do
    subject { build :event }

    it 'must have fields and associations' do
      must belong_to(:author).class_name 'User'
      must belong_to(:owner).class_name 'Contact'
      must belong_to(:subject)
      must have_many(:contacts).through :contacts_events
      must have_many(:info_documents).class_name 'EventDocument'
      must have_many(:excercise_documents).class_name 'EventDocument'
      must have_many(:resolution_documents).class_name 'EventDocument'
      must have_db_column :title
      must have_db_column :description
      must have_db_column :excercise
      must have_db_column :resolution
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

  describe 'intersections' do
    # 01234567890123456
    before do
      @intersected = [
    #    <-------->
        create(:event, start:  3.days.from_now, finish: 12.days.from_now),
    #        <->
        create(:event, start:  7.days.from_now, finish:  9.days.from_now),
    #          <---->
        create(:event, start:  9.days.from_now, finish: 14.days.from_now),
    #  <----->
        create(:event, start:  1.days.from_now, finish:  7.days.from_now),
      ]
      @non_intersected = [
    # <-->
        create(:event, start:  0.days.from_now, finish:  3.days.from_now),
    #              <-->
        create(:event, start: 13.days.from_now, finish: 16.days.from_now),
      ]
      @central =
    #      <----->
        create(:event, start:  5.days.from_now, finish: 11.days.from_now)
    end

    subject { @central.intersections }

    describe 'finds all and only intersects' do
      it 'intersects correctly' do
        subject.must_equal @intersected
      end
    end
  end
end
