Feature: Can search for and select a user.

@javascript
Scenario:
    Given the "admin" with password "taliesin" is logged in
    And I press "users" link

    When I type "Lo" into the search field "q" and I choose "Chris Loftus"
    Then page should have "622422" message.

    #Search by firstname and check that Chris Loftus does not appear in results
    When I check "firstname"
    And I fill in "q" with "Firstname"
    And I press "Search" button
    Then the page should not contain "Chris"
    And page should have "Firstname1" message.
    And page should have "Firstname10" message.
    # here I am assuming that if the first two results that match the search are found, then so are the others

    #Search by surname
    When I check "surname"
    And I uncheck "firstname"
    And I fill in "q" with "Surname"
    And I press "Search" button
    Then the page should not contain "Chris"
    And page should have "Firstname1" message.
    And page should have "Firstname10" message.

    #check that when a search does not match any results the correct message is shown
    When I fill in "q" with "None"
    And I press "Search" button
    And page should have "No entries found" message.