When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
    fill_in(field.gsub(' ', '_'), :with => value)
    #puts "User: #{USERS['one']['surname']}"
end

