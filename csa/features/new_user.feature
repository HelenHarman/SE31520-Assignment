Feature: Test that a new user can be created.
            Invalid option can not be entered into the new user form


Scenario Outline: Enter a new valid user and check they are added. Also perform the valid range check on the graduation year.
    Given the "admin" with password "taliesin" is logged in
    And I press "users" link
    And I press "New User" link

    Then I fill in "user_firstname" with "Fred"
    And I fill in "user_surname" with "Blogs"
    And I fill in "user_phone" with "07576947302"
    And I fill in "user_grad_year" with "<grad_year>"
    And I fill in "user_email" with "fred@outlook.com"
    And I fill in "user_user_detail_attributes_login" with "Fred"
    And I fill in "user_user_detail_attributes_password" with "password"
    And I fill in "user_user_detail_attributes_password_confirmation" with "password"

    And I press "Create" button
    Then page should have "Account was successfully created" message.
    When I visit the user "42" page
    Then page should have "Fred Blogs" message.

    Examples:
        | grad_year |
        |   2014    |
        |   1970    |
        |   2000    |


Scenario Outline: Checks that invalid options can't be entered into new user form
    Given the "admin" with password "taliesin" is logged in
    And I press "users" link
    And I press "New User" link

    Then I fill in "user_firstname" with "<firstname>"
    And I fill in "user_surname" with "<surname>"
    And I fill in "user_phone" with "<phone>"
    And I fill in "user_grad_year" with "<grad_year>"
    And I fill in "user_email" with "<email>"
    And I fill in "user_user_detail_attributes_login" with "<login>"
    And I fill in "user_user_detail_attributes_password" with "<password>"
    And I fill in "user_user_detail_attributes_password_confirmation" with "<password_confirmation>"

    And I press "Create" button
    Then page should have "<message>" message.
    Then I should be on the users page

    Examples:
        | firstname | surname |    phone    | grad_year |      email       | login | password | password_confirmation |           message          |
        |           |  Blogs  | 07576947302 |   1995    | fred@outlook.com | fred  | password |        password       |  Firstname can't be blank  |
        |    Fred   |         | 07576947302 |   1995    | fred@outlook.com | fred  | password |        password       |  Surname can't be blank    |
        |    Fred   |  Blogs  | 07576947302 |           | fred@outlook.com | fred  | password |        password       |  Grad year can't be blank  |
        |    Fred   |  Blogs  | 07576947302 |   abcd    | fred@outlook.com | fred  | password |        password       |  Grad year is not a number |
        |    Fred   |  Blogs  | 07576947302 |   1969    | fred@outlook.com | fred  | password |        password       | Grad year must be greater than or equal to 1970 |
        |    Fred   |  Blogs  | 07576947302 |   2015    | fred@outlook.com | fred  | password |        password       | Grad year must be less than or equal to 2014 |
        |    Fred   |  Blogs  | 07576947302 |   1995    |                  | fred  | password |        password       |    Email can't be blank   |
        |    Fred   |  Blogs  | 07576947302 |   1995    |      invalid     | fred  | password |        password       |  Email Bad email address format  |
        |    Fred   |  Blogs  | 07576947302 |   1995    | cwl1@aber.ac.uk  | fred  | password |        password       |   Email has already been taken   |
        |    Fred   |  Blogs  | 07576947302 |   1995    | fred@outlook.com |       | password |        password       | User detail login can't be blank |
        |    Fred   |  Blogs  | 07576947302 |   1995    | fred@outlook.com | cwl2  | password |        password       | User detail login has already been taken |
        |    Fred   |  Blogs  | 07576947302 |   1995    | fred@outlook.com | fred  |          |        password       | User detail password can't be blank |



Scenario: Check that you get redirected to users page when you try to visit none exisiting account.
    Given the "admin" with password "taliesin" is logged in
    And I visit the user "70" page
    Then I should be on the users page
    And page should have "Account no longer exists" message.

