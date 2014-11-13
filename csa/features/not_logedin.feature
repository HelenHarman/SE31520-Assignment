Feature: When no one is logged in
    the index page should be the only page avaliable.

Scenario: When I load website
    Given I am on the home page
    Then page should have "Welcome to CS-Alumni News" message.


