require 'capybara'
require 'cucumber/rails'
require 'email_spec'
require 'email_spec/cucumber'

Capybara.default_selector = :css
ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
