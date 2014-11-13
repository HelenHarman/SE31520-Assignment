Feature: When admin is loged in
    the correct tabs are avaliable in the index page.
    The admin is allow to edit there details and the details of other users.

Scenario: When the admin is logged in
    Given I am on the login page
    And I fill in "login-input" with "admin"
    And I fill in "password" with "taliesin"
    When I press "Login" within "#form_buttons" button
    Then page should have "Logged in successfully" message.

    Then I press "profile" link
    Then I should be on user "41" page
    And page should have "Chris Loftus" message.

    When I press "Edit" link
    And I should be on user "41" edit page
    And I fill in "user_firstname" with "Tom"
    And I press "Update" button
    Then page should have "Tom Loftus" message.