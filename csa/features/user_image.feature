Feature: Check that the user image is uploaded and displayed correctly.

@javascript
Scenario: Upload a new photo to the admin user.
    Given the "admin" with password "taliesin" is logged in
    Then I press "profile" link
    And I press "Edit" link

    And I "image_file" "/images/dragonFly.jpg"
    And I press "Update" button
    And save the page
    Then I have "dragonFly.jpg" image