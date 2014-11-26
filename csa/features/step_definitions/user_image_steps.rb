Then /^I "([^\"]*)" "([^\"]*)"$/ do |upload_button, file_name|
    attach_file(upload_button, File.join(Rails.root, 'features', file_name))
    
end

Then /^I have "([^\"]*)" image$/ do |image_name|
    assert has_xpath?("//a[contains(@href, '#{image_name}')]")
end