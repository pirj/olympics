require 'test_helper'

describe Contact do
  describe 'basic' do
    subject { build :contact }

    it 'must have fields and associations' do
      must have_db_column :name
      must have_db_column :phone
      must have_db_column :email
      must have_db_column :organization
      must have_db_column :position
    end

    it 'validates attributes' do
      must have_valid(:name).when('Василий Иванович Петров')
      wont have_valid(:name).when(nil, '')
      must have_valid(:phone).when('+7-911-112-33-44')
      wont have_valid(:phone).when('', nil)
      must have_valid(:email).when('vip@mail.ru')
      wont have_valid(:email).when('', 'нет', nil)
      must have_valid(:organization).when('Школа №1')
      wont have_valid(:organization).when('', nil)
      must have_valid(:position).when('Горнист')
      wont have_valid(:position).when('', nil)
    end
  end
end
