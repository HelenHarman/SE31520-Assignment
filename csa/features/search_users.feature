Feature: Can search for and select a user.

@javascript
Scenario:
    Given the "admin" with password "taliesin" is logged in
    And I press "users" link

    When I type "Lo" into the search field "q" and I choose "Chris Loftus"
    Then save the page