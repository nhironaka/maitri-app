Feature: allow a user to reset password if they forgot password 
  As a user
  So that I can reset my password if I forgot it
  I want to be reset my password so I can login with the new password
  
Background: users in database
  
  Given the following users exist:
  | username                | password    | email                | password_confirmation |
  | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  
  And I am on the Login page

Scenario: reset password with legitimate email and new password
    When I click on the forgot password link
    Then I should see "Enter email"
    When I fill in "Enter email" with "existuser1@gmail.com"
    And I press "Reset password"
    Then I should see "Check your email"
    When I go to the reset password link
    Then I should see "Enter new password"
    And I should see "Confirm new password"
    When I fill in "Enter new password" with "newpassword1"
    And I fill in "Confirm new password" with "newpassword1"
    And I press "Confirm"
    Then I should be on the Login page.
    When I fill in "user_login" with "existuser"
    And I fill in "user_password" with "newpassword1"
    And I press "Log In"
    Then I should be on the home page

Scenario: reset password with legitimate email and new password old password should fail
    When I click on the forgot password link
    Then I should see "Enter email"
    When I fill in "Enter email" with "existuser1@gmail.com"
    And I press "Reset password"
    Then I should see "Check your email"
    When I go to the reset password link
    Then I should see "Enter new password"
    And I should see "Confirm new password"
    When I fill in "Enter new password" with "newpassword1"
    And I fill in "Confirm new password" with "newpassword1"
    And I press "Confirm"
    Then I should be on the Login page.
    When I fill in "user_login" with "existuser"
    And I fill in "user_password" with "existuser1"
    And I press "Log In"
    Then I should see "Invalid login or password"

Scenario: reset password with illegimate email
    When I click on the forgot password link
    Then I should see "Enter email"
    When I fill in "Enter email" with "nouser@gmail.com"
    And I press "Reset password"
    Then I should see "Please enter a valid email"
    
Scenario: reset password with blank email
    When I click on the forgot password link
    Then I should see "Enter email"
    When I press "Reset password"
    Then I should see "Please enter a valid email"

Scenario: reset password with blank password
    When I click on the forgot password link
    Then I should see "Enter email"
    When I fill in "Enter email" with "existuser1@gmail.com"
    And I press "Reset password"
    Then I should see "Check your email"
    When I go to the reset password link
    Then I should see "Enter new password"
    And I should see "Confirm new password"
    When I press "Confirm"
    Then I should see "Please enter a valid password"

Scenario: reset password forgot to fill in confirm new password
    When I click on the forgot password link
    Then I should see "Enter email"
    When I fill in "Enter email" with "existuser1@gmail.com"
    And I press "Reset password"
    Then I should see "Check your email"
    When I go to the reset password link
    Then I should see "Enter new password"
    And I should see "Confirm new password"
    When I fill in "Enter new password" with "newpassword1"
    And I press "Confirm"
    Then I should see "Please confirm your password"
    
  