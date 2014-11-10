Feature: When admin is loged in
    the correct options are shown in the index page.

Scenario: When the admin is logged in
    Given I am on the login page
    And I fill in "login-input" with "admin"
    And I fill in "password" with "taliesin"
    When I press "Login"
    Then page should have "Logged in successfully" message.
