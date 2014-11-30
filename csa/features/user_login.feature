Feature: When a none admin user is logged in
    they should not have permission to access broadcast or users page
    but should have permission to view and edit there own profile.

Scenario: Login as a user (that isn't admin) and check that they are unable to access the broadcast or users page.
    Given the "cwl2" with password "secret" is logged in
    Then page should have "Logged in successfully" message.

    Then "profile" tab should be avaliable
    Then save the page
    And "broadcast" tab should not be avaliable

    #check that get redirected back to home page when try to access the broadcasts page
    When I visit the broadcasts page
    Then I get redirected to the home page

    When I visit the users page
    Then I get redirected to the home page

    When I visit the user "40" page
    Then I get redirected to the home page

    When I visit the user "40" edit page
    Then I get redirected to the home page


