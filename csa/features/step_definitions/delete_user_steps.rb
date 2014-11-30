## delete_user_steps.rb
# Clicks the destroy user button, and handles the delete user alert
#
# @author Helen Harman
# @created November 2014

When(/^I click delete for user "([0-9]+)"$/) do |user_id|
    click_link("Destroy", :href => "#{user_path(:id => user_id)}?page=1" )
    page.driver.browser.switch_to.alert.accept
end
