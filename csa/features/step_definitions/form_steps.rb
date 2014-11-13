When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
    fill_in(field.gsub(' ', '_'), :with => value)
    #puts "User: #{USERS['one']['surname']}"
end


Given(/^the "(.*?)" with password "(.*?)" is logged in$/) do |user_name, password|
    visit path_to("the login page")
    fill_in("login-input", :with => user_name)
    fill_in("password", :with => password)
    within("#form_buttons") do
        click_button("Login")
    end
end
