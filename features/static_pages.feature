Feature: Static pages
  In order to get some information about Auctioneer
  I want to view static pages

  Scenario: Home page
    When I go to the home page
    Then I should see "Auctioneer"
