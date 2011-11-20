Feature: Managing auction

  Scenario: Creating a new auction
    Given I am logged in as user "quentin"
    When I go to the users dashboard
    And I follow "new user"

  Scenario: Viewing auctions
    Given I am on the auctions page
    And an auction "Fender" with description "Good guitar"
    And an auction "Lenovo" with description "Vintage stuff"
    Then I should see "Fender" within "h4"
    And I should see "Lenovo" within "h4"

  Scenario: Editing auction
