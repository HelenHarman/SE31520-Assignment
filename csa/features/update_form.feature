Feature: When invalid data is enetered into the user update form
    a user freindly error message is displayed.

Scenario:
    Given the "admin" with password "taliesin" is logged in
    And I press "profile" link
    And I press "Edit" link

    When I fill in "user_firstname" with ""

#TODO : fill in form with incorrect data
# test the ranges for the numbers and test empty string
# test email for foregin countries ect.
# (copy the stuff from the admin_login test)