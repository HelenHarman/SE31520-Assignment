Feature: The admin user can delete a user

@javascript
Scenario:
    Given the "admin" with password "taliesin" is logged in
    And I press "users" link
    When I click delete for user "1"
    Then the page should not contain "cwl0@aber.ac.uk"