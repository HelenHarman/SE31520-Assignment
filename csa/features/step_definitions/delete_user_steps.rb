When(/^I click delete for user "([0-9]+)"$/) do |user_id|
    click_link("Destroy", :href => "#{user_path(:id => user_id)}?page=1" )
    page.driver.browser.switch_to.alert.accept
end

Then(/^the page should not contain "(.*?)"$/) do |user_email|
    assert !page.has_content?(user_email)
end