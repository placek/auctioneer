Feature: Admin panel
  In order to administrate the page
  As a super user
  I want to manage the application

  Scenario: Entering and leaving the panel
    Given I am on the admins panel
    And an admin "admin"
    When I fill in the following:
      | admin_email    | admin@example.com |
      | admin_password | secret            |
    And press "Sign in"
    And I follow "Leave panel"
    Then I should see "Auctioneer system"
    When I go to the admins panel
    And I follow "Sign out"
    Then I should see "Auctioneer system"

  Scenario: Managing admins
    Given I am on the admins panel
    And an admin "admin"
    And an admin "super_user"
    When I fill in the following:
      | admin_email    | admin@example.com |
      | admin_password | secret            |
    And press "Sign in"
    And I follow "Admins (2)"
    Then I should see "admin@example.com"
    And I should see "super_user@example.com"

  Scenario: Managing users
    Given I am on the admins panel
    And an admin "admin"
    And a user "quentin"
    When I fill in the following:
      | admin_email    | admin@example.com |
      | admin_password | secret            |
    And press "Sign in"
    And I follow "Users (1)"
    Then I should see "quentin@example.com"
