require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# used for visiting a specific page
Given /^I am on (.+)$/ do |page_name|
    visit path_to(page_name)
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
    #save_and_open_page
    page.has_content?(message)
end

Then(/^I should be on user "([0-9]+)" page$/) do |userID|
    assert page.current_path == user_path(:id => userID)
end

When(/^I should be on user "([0-9]+)" edit page$/) do |userID|
    assert page.current_path == edit_user_path(:id => userID)
end





