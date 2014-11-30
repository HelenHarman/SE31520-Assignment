Feature: When no one is logged in
    the index page should be the only page avaliable.

Scenario: Check home page is loaded when we first visit the website
    Given I am on the home page
    Then page should have "Welcome to CS-Alumni News" message.

Scenario Outline: Checks that invalid options can't be entered into login form
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



Scenario: Redirects to login page when try to access any page (that isn't the home page)
    When I visit the broadcasts page
    Then I get redirected to the login page
    And page should have "Please log in" message.

    When I visit the user "40" page
    Then I get redirected to the login page
    And page should have "Please log in" message.



Scenario: Checks a user is able to log in and log out
    When I am on the login page
    And I fill in "login-input" with "admin"
    And I fill in "password" with "taliesin"
    When I press "Login" within "#form_buttons" button
    Then page should have "Logged in successfully" message.

    When I press "Logout" button
    Then I should be on home page
    And "profile" tab should not be avaliable
