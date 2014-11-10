require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

Then(/^page should have "([^\"]*)" message\.$/) do |message|
    page.has_content?(message)
    #page.should have_content(arg1)
end





