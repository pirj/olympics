require "test_helper"

describe Event do
  describe 'basic' do
    subject { build :user }

    it 'must have fields and associations' do
      must have_db_column :role
      must have_db_column :department
      must have_db_column :username
      must have_db_column :email
    end

    it 'validates attributes' do
      must have_valid(:username).when('asd  asd asd ')
      wont have_valid(:username).when(nil, '')
      must have_valid(:email).when('asd  asd asd ')
      wont have_valid(:email).when(nil, '')

      must have_valid(:role).when(:super_admin, :admin, :none)
      wont have_valid(:role).when(nil, '', :lol)
      must validate_inclusion_of(:role).in_array %w(super_admin admin none)

      must have_valid(:department).when(:ko, :knvsh, :tso, :none)
      wont have_valid(:department).when(nil, '', :lol)
      must validate_inclusion_of(:department).in_array %w(ko knvsh tso none)
    end
  end
end
