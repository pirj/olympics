ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/pride"
require "minitest/matchers_vaccine"
require "valid_attribute"
# require "pry-rescue/minitest"

FactoryGirl.lint

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include ValidAttribute::Method

  DatabaseRewinder.clean_all

  ActiveRecord::Migration.check_pending!
  def teardown
    DatabaseRewinder.clean
  end
end
