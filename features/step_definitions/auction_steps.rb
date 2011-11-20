require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^an auction "([^\"]+)"(?:| with description "([^\"]+)")$/ do |name, description|
  Factory(:auction, title: name, description: description)
end
