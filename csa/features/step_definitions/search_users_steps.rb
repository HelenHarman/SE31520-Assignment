## search_users_steps.rb
# Allows the users to be searched
#
# @author Helen Harman
# @created November 2014

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "search_helper"))

When /^I type "([^\"]*)" into the search field "([^\"]*)" and I choose "([^\"]*)"$/ do |data, search_field, select_user|
    search_and_click_on_user(search_field, :with => data)
end


