## user_image_steps.rb
# Contains the steps for uploading and checking for a users image.
#
# @author Helen Harman
# @created November 2014

Then /^I "([^\"]*)" "([^\"]*)"$/ do |upload_button, file_name|
    attach_file(upload_button, File.join(Rails.root, 'features', file_name))
    
end

Then /^I have "([^\"]*)" image$/ do |image_name|
    assert has_xpath?("//a[contains(@href, '#{image_name}')]")
end