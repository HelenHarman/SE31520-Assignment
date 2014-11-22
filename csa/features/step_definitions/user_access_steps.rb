Then(/^"(.*?)" tab should be avaliable$/) do |tab_id|
    assert has_selector?(:xpath, "//a[@id='#{tab_id}']")
end

Then(/^"(.*?)" tab should not be avaliable$/) do |tab_id|
    print has_no_xpath?("//a[@id='#{tab_id}']")
    assert has_no_xpath?("//a[@id='#{tab_id}']")
    #assert !have_selector(:xpath, "//a[@id='#{tab_id}']")
end