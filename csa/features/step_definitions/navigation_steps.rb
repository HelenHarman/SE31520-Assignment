## navigation_steps.rb
# Contains the steps for navigating around the CSA application
#
# @author Helen Harman
# @created November 2014

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# used for visiting a specific page
Given /^I (?:am|visit) (?:on|the) (.+)$/ do |page_name|
    visit path_to(page_name)
end


# used for clicking on buttons and links within a page
Then /^I press "([^\"]*)" link$/ do |link|
    click_link(link)
end

When /^I press "([^\"]*)" within "([^\"]*)" button$/ do |button, div_tag|
    within(:xpath, '//form[@action="/session"]') do#(div_tag) do
        click_button(button)
    end
end

When /^I press "([^\"]*)" button$/ do |button|
    click_button(button)
    sleep(1) # had issues with page being slow to load.
end



# used to check what page we are on and the content of that page
Then(/^page should have "([^\"]*)" message\.$/) do |message|
    assert page.has_content?(message)
end

Then(/^the page should not contain "(.*?)"$/) do |message|
    assert !page.has_content?(message)
end

Then(/^the status code should be "([0-9]+)"$/) do |status_code|
    assert page.status_code == status_code.to_i
end


# check what page we are on
Then(/^I should be on (.+)$/) do |page_name|
    assert page.current_path == path_to(page_name)
end



# saves the content of the page. Used for debugging.
Then(/^save the page$/) do
    save_and_open_page
end
