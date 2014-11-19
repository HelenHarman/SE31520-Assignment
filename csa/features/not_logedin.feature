Feature: When no one is logged in
    the index page should be the only page avaliable.

Scenario: When I load website
    Given I am on the home page
    Then page should have "Welcome to CS-Alumni News" message.

Scenario Outline: checks that invalid options can't be entered into login form
    Given I am on the login page
    And I fill in "login-input" with "<role>"
    And I fill in "password" with "<access>"
    When I press "Login" within "#form_buttons" button
    Then page should have "Couldn't log you in as" message.

    Examples:
        | role   | access   |
        |        | taliesin |
        | admin  |          |
        | hello  | taliesin |
        | admin  | invalid  |