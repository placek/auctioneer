Feature: User accounts
  In order to have a private account
  A user
  Wants to manage it

  Scenario: Registering a user account
    Given I am on the home page
    And no emails have been sent
    When I follow "Sign up"
    And I fill in the following:
      | user_email                 | user@example.com |
      | user_password              | monkey           |
      | user_password_confirmation | monkey           |
    And I press "Sign up"
    Then "user@example.com" should receive an email
    When "user@example.com" opens the email
    Then I should see "Confirmation instructions" in the email subject
    And I should see "You can confirm your account through the link below" in the email body
    And I should see "Confirm my account" in the email body
    When I follow "Confirm my account" in the email
    Then I should see "Your account was successfully confirmed. You are now signed in."
    And I should see "Sign out"

  Scenario: Changing users password
    Given a user "quentin"
    And I am on the home page
    When I follow "Sign in"
    And I follow "Forgot your password?"
    And I fill in the following:
      | user_email | quentin@example.com |
    And I press "Send me reset password instructions"
    Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."
    And "quentin@example.com" should receive an email
    When "quentin@example.com" opens the email
    Then I should see "Reset password instructions" in the email subject
    And I should see "Someone has requested a link to change your password, and you can do this through the link below." in the email body
    When I follow "Change my password" in the email
    Then I should see "Change your password"
    When I fill in the following:
      | user_password              | monkey |
      | user_password_confirmation | monkey |
    And I press "Change my password"
    Then I should see "Your password was changed successfully. You are now signed in."

  Scenario: Resend a confirmation instructions
    Given I am on the home page
    And an unconfirmed user "user"
    And a clear email queue
    When I follow "Sign up"
    And I follow "Didn't receive confirmation instructions?"
    Then I should see "Resend confirmation instructions"
    When I fill in the following:
      | user_email | user@example.com |
    And I press "Resend confirmation instructions"
    Then I should see "You will receive an email with instructions about how to confirm your account in a few minutes."
    And "user@example.com" should receive an email
    When "user@example.com" opens the email
    Then I should see "Confirmation instructions" in the email subject
    And I should see "You can confirm your account through the link below" in the email body

  Scenario: Logging in and out
    Given a user "quentin"
    And I am on the home page
    When I follow "Sign in"
    And I fill in the following:
      | user_email    | quentin@example.com |
      | user_password | secret              |
   And I press "Sign in"
   Then I should see "User's dashboard"
