require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^an admin "([^\"]+)"$/ do |name|
  Factory(:admin, email: "#{name}@example.com")
end
