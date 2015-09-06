require 'test_helper'

describe Vote do
  subject { build :vote }

  it 'must have fields and associations' do
    must belong_to :answer
  end
end
