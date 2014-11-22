Feature: When a none admin user is logged in
    they should not have permission to access broadcast or users page
    but should have permission to view and edit there own profile.

Scenario:
    Given the "cwl2" with password "secret" is logged in
    Then page should have "Logged in successfully" message.

    Then "profile" tab should be avaliable
    Then save the page
    And "broadcast" tab should not be avaliable

