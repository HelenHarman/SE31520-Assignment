require 'json'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "helper"))


Then(/^check twitter updated with "([^\"]*)"$/) do |tweet_content|
    result = TWITTER_ACCESS_TOKEN.get("/statuses/home_timeline.json?screen_name=chris_loftus_te&count=1")
    #print result.body # used for debugging

    parsedJson = JSON.parse result.body
    #print parsedJson[0]["text"] # used for debugging
    assert parsedJson[0]["text"] == "#{tweet_content} : #{getHoursAndMins}"
end


Then(/^I enter broadcast "([^\"]*)" with the current time$/) do |tweet_content|
    fill_in("broadcast_content", :with => "#{tweet_content} : #{getHoursAndMins}")
end


And(/^only Twitter option is checked$/) do
    uncheck('feeds_email')
    uncheck('feeds_facebook')
    uncheck('feeds_RSS')
    uncheck('feeds_atom')
    
    check('feeds_twitter')
end