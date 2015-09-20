require 'test_helper'

describe Registration do
  describe 'basic' do
    subject { build :registration }

    it 'must have fields and associations' do
      must have_db_column :name
      must have_db_column :email
      must have_db_column :note
    end

    it 'validates attributes' do
      must have_valid(:name).when('Василий Иванович Петров')
      wont have_valid(:name).when(nil, '')
      must have_valid(:email).when('vip@mail.ru')
      wont have_valid(:email).when('', 'нет', nil)
      must have_valid(:note).when('Ну пожалуйста')
      wont have_valid(:note).when('', nil)
    end
  end
end
