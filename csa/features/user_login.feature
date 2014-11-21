Feature: When a none admin user is logged in
    they should not have permission to .....//TODO

Scenario:
    Given the "cwl2" with password "secret" is logged in
    Then page should have "Logged in successfully" message.

