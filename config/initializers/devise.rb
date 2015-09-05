Devise.setup do |config|
  require 'devise/orm/active_record'

  config.authentication_keys = [:username]
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email, :username]

  # Limiting the stretches to just one in testing will increase the performance of your test suite dramatically
  config.stretches = Rails.env.test? ? 1 : 10
end
