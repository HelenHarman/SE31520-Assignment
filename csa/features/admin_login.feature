Feature: When admin is loged in
    the correct tabs are avaliable in the index page.
    The admin is allow to edit there details and the details of other users.

Scenario: When the admin is logged in
    Given I am on the login page
    And I fill in "login-input" with "admin"
    And I fill in "password" with "taliesin"
    When I press "Login" within "#form_buttons" button
    And the status code should be "200"
    Then page should have "Logged in successfully" message.

    Then I press "profile" link
    Then I should be on user "41" page
    And page should have "Chris Loftus" message.

    When I press "Edit" link
    And I should be on user "41" edit page
    And I fill in "user_firstname" with "Tom"
    And I press "Update" button
    And the status code should be "200"
    Then page should have "Tom Loftus" message.


    When I visit the user "40" page
    Then page should have "Firstname39 Surname39" message.
    And the status code should be "200"
    When I press "Edit" link
    And I should be on user "40" edit page
    And I fill in "user_grad_year" with "2001"
    And I press "Update" button
    And the status code should be "200"
    Then page should have "2001" message.

    When I press "Edit" link
    And I should be on user "40" edit page
    And I fill in "user_grad_year" with "1969"
    And I press "Update" button
    Then page should have "Grad year must be greater than or equal to 1970" message.
    
    
    

#When I press "change" link
#And I should be on editting "50" page
#And I fill in "change this to that" with "change that to this"
#And I press "save" button
