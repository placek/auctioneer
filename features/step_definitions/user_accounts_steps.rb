require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^a user "([^\"]+)"$/ do |name|
  Factory(:confirmed_user, email: "#{name}@example.com")
end

Given /^an unconfirmed user "([^\"]+)"$/ do |name|
  Factory(:user, email: "#{name}@example.com")
end

Given /^I am logged in as user "([^\"]+)"$/ do |name|
  user = User.where(email: "#{name}@example.com").first || Factory(:confirmed_user, email: "#{name}@example.com")
  sign_in(:user, user)
end
