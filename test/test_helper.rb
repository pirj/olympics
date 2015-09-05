ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/spec"
require "minitest/pride"
require "minitest/matchers_vaccine"
require "valid_attribute"
# require "pry-rescue/minitest"

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include ValidAttribute::Method

  ActiveRecord::Migration.check_pending!

  DatabaseCleaner.strategy = :transaction

  before do
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end
end
