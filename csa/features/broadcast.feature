Feature: Create a new broardcast and check it is tweeted

Scenario:
    Given the "admin" with password "taliesin" is logged in
    And I press "broadcasts" link
    And I press "New broadcast" link

    And only Twitter option is checked
#When I fill in "broadcast_content" with "cucumber broardcast"
    Then I enter broadcast "cucumber broardcast" with the current time
    And I press "Broadcast" button

    Then save the page


    Then check twitter updated with "cucumber broardcast"