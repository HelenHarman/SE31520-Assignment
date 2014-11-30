Feature: Create a new broardcast and check it is tweeted

@javascript
Scenario: Tweet a broadcast and check that it has been tweeted. Delete that broadcast and check it has been deleted.
    Given the "admin" with password "taliesin" is logged in
    And I press "broadcasts" link
    And I press "New broadcast" link

    And only Twitter option is checked
    Then I enter broadcast "cucumber broadcast" with the current time
    And I press "Broadcast" button
    Then check twitter updated with "cucumber broadcast"
    And page should have "Broadcast was successfully saved and broadcast to all feeds" message.
    Then I click show on the first broadcast
    Then page should have "cucumber broadcast" message.


    # check that a broadcast can be deleted
    When I press "Back" link
    When I click delete for broadcast "1"
    Then page should have "No entries found" message.


    # check that a tweet over 150 characters can not be posted
    Then I press "broadcasts" link
    And I press "New broadcast" link
    And I fill in "broadcast_content" with "this post will be longer than a twitter feed post is allowed to be. It has been written for cucumber testing of CSA app. Should not be posted"
    And I press "Broadcast" button
    Then I should be on broadcasts page
    And page should have "Broadcast was successfully saved, but problems broadcasting to one or more feeds" message.



Scenario: Adding multiple broadcasts
    Given the "admin" with password "taliesin" is logged in
    And I press "broadcasts" link

    And I press "New broadcast" link
    Then I enter broadcast "cucumber 1st of multiple broadcasts" with the current time
    And I press "Broadcast" button
    Then check twitter updated with "cucumber 1st of multiple broadcasts"

    Then I press "New broadcast" link
    Then I enter broadcast "cucumber 2nd of multiple broadcasts" with the current time
    And I press "Broadcast" button
    Then check twitter updated with "cucumber 2nd of multiple broadcasts"


    Then I visit the broadcast "1" page
    And page should have "cucumber 1st of multiple broadcasts" message.
    Then I visit the broadcast "2" page
    And page should have "cucumber 2nd of multiple broadcasts" message.