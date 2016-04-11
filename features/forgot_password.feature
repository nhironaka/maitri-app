Feature: allow a user to reset password if they forgot password 
  As a user
  So that I can reset my password if I forgot it
  I want to be reset my password so I can login with the new password
  
Background: users in database
  
  Given the following users exist:
  | username                | password    | email                | password_confirmation |
  | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  
  And I am on the reset password page
  Then I should see "Email"
  And I should see "Log in"

Scenario: reset password with legitimate email and new password
    When I fill in "user_email" with "existuser1@gmail.com"
    And I press "Send me reset password instructions"
    Then I should be on the Login page
    And I should see "You will receive an email with instructions on how to reset your password in a few minutes."

Scenario: reset password with illegimate email
    When I fill in "user_email" with "nouser@gmail.com"
    And I press "Send me reset password instructions"
    Then I should not see "You will receive an email with instructions on how to reset your password in a few minutes."

