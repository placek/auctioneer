Feature: Static pages
  In order to get some information about Auctioneer
  I want to view static pages

  Scenario: Landing page presence
    When I go to the landing page
    Then I should see "Auctioneer"

  Scenario: Moving between language scopes
    When I go to the polish landing page
    Then I should see "Witaj na Auctioneer (beta)! Nie krępuj się i testuj."
    When I go to the english landing page
    Then I should see "Welcome to Auctioneer (beta)! Feel free to test it."

