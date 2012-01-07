Feature: Managing auction

  Scenario: Creating a new auction
    Given I am logged in as user "quentin"
    When I go to the users dashboard

  Scenario: Viewing auctions
    Given an auction "Fender" with description "Good guitar"
    And an auction "Lenovo" with description "Vintage stuff"
    And I am on the auctions page
    Then I should see "Fender"
    And I should see "Lenovo"

  Scenario: Editing auction
    Given I am logged in as user "quentin"
    And an auction "Fender" with description "Good guitar" set by "quentin"
    When I go to the auction "Fender" edit page
    And I fill in "Name" with "Ibanez"
    And I press "Update"
    And I should see "Ibanez"
