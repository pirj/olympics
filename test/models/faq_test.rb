require 'test_helper'

describe Faq do
  describe 'basic' do
    subject { build :faq }

    it 'must have fields and associations' do
      must have_db_column :question
      must have_db_column :answer
    end

    it 'validates attributes' do
      must have_valid(:question).when('Скажите как его зовут')
      wont have_valid(:question).when(nil, '')
      must have_valid(:answer).when('Бу ра ти но')
      wont have_valid(:answer).when(nil, '')
    end
  end
end
