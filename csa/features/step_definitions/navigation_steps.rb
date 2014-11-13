require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# used for visiting a specific page
Given /^I am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

When(/^I visit the user "([0-9]+)" page$/) do |user_id|
    visit user_path(:id => user_id)
end



# used for clicking on buttons and links within a page
Then /^I press "([^\"]*)" link$/ do |link|
    click_link(link)
end

When /^I press "([^\"]*)" within "([^\"]*)" button$/ do |button, div_tag|
    within(div_tag) do
        click_button(button)
    end
end

When /^I press "([^\"]*)" button$/ do |button|
    click_button(button)
end



# used to check what page we are on and the content of that page
Then(/^page should have "([^\"]*)" message\.$/) do |message|
    save_and_open_page
    assert page.has_content?(message)
end

Then(/^the status code should be "([0-9]+)"$/) do |status_code|
    assert page.status_code == status_code.to_i
end

Then(/^I should be on user "([0-9]+)" page$/) do |user_id|
    assert page.current_path == user_path(:id => user_id)
end

When(/^I should be on user "([0-9]+)" edit page$/) do |user_id|
    assert page.current_path == edit_user_path(:id => user_id)
end







