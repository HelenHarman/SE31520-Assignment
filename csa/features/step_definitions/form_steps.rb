## form_steps.rb
# Contains the steps for filling in a form
#
# @author Helen Harman
# @created November 2014

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

##
# Fills in the login page and clicks the login button
Given(/^the "(.*?)" with password "(.*?)" is logged in$/) do |user_name, password|
    visit path_to("the login page")
    fill_in("login-input", :with => user_name)
    fill_in("password", :with => password)
    within("#form_buttons") do
        click_button("Login")
    end
end


When(/^I check "(.*?)"$/) do |check_box_name|
    check(check_box_name)
end

When(/^I uncheck "(.*?)"$/) do |check_box_name|
    uncheck(check_box_name)
end