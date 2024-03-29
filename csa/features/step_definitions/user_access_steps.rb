## user_access_steps.rb
# Used in checked what access a user has to the CSA application
#
# @author Helen Harman
# @created November 2014

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Then(/^"(.*?)" tab should be avaliable$/) do |tab_id|
    assert has_selector?(:xpath, "//a[@id='#{tab_id}']")
end

Then(/^"(.*?)" tab should not be avaliable$/) do |tab_id|
    assert has_no_xpath?("//a[@id='#{tab_id}']")
end

Then(/^I get redirected to (.+)$/) do |page_name|
    assert current_path == path_to(page_name)
end
