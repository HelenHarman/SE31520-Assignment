Feature: Create a new broardcast and check it is tweeted

Scenario:
    Given the "admin" with password "taliesin" is logged in
    And I press "broadcasts" link
    And I press "New broadcast" link

    And only Twitter option is checked
    Then I enter broadcast "cucumber broadcast" with the current time
    And I press "Broadcast" button
    Then check twitter updated with "cucumber broadcast"