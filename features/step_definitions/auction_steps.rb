require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^an auction "([^"]*)" with description "([^"]*)"(?:| set by "([^"]*)")$/ do |title, description, name|
  if name.nil?
    Factory(:auction, title: title, description: description)
  else
    user = User.where(email: "#{name}@example.com").first || Factory(:confirmed_user, email: "#{name}@example.com")
    Factory(:auction, title: title, description: description, user: user)
  end
end
