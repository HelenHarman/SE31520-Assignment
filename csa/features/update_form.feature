Feature: When invalid data is enetered into the user update form
    a user freindly error message is displayed.

Scenario: Update the admin users details from the edit page and check that helpful error message is displayed.
    Given the "admin" with password "taliesin" is logged in
    And I press "profile" link
    And I press "Edit" link


    #Test the first name field
    When I fill in "user_firstname" with ""
    And I press "Update" button
    Then page should have "Firstname can't be blank" message.


    #Test the surname field
    When I fill in "user_firstname" with "Tom"
    And I fill in "user_surname" with ""
    And I press "Update" button
    Then page should have "Surname can't be blank" message.


    #Test the email field
    When I fill in "user_surname" with "Bloggs"
    And I fill in "user_email" with "aaa@aber"
    And I press "Update" button
    Then page should have "Email Bad email address format" message.


    #Test the Grad. year field
    When I fill in "user_email" with "aaa@aber.com"
    And I fill in "user_grad_year" with "1969"
    And I press "Update" button
    Then page should have "Grad year must be greater than or equal to 1970" message.

    When I fill in "user_grad_year" with "2015"
    And I press "Update" button
    Then page should have "Grad year must be less than or equal to 2014" message.


    #All fields with valid details
    When I fill in "user_grad_year" with "2013"
    And I press "Update" button
    Then I should be on user "41" page


