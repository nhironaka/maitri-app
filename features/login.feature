Feature: login as a user
  
  As a user
  So that I can login as a user
  I want to be able to access the homepage

Background: users in database
  
  Given the following users exist:
  | username                | password    | email                | password_confirmation |
  | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  
  And I am on the Login page
  
Scenario: login legitimate user
  When I fill in "user_login" with "existuser"
  And I fill in "user_password" with "existuser1"
  And I press "Log In"
  Then I should be on the home page
  
Scenario: login with email
  When I fill in "user_login" with "existuser1@gmail.com"
  And I fill in "user_password" with "existuser1"
  And I press "Log In"
  Then I should be on the home page
  
Scenario: login user that does not exist
  When I fill in "user_login" with "invalid"
  And I fill in "user_password" with "invalid"
  And I press "Log In"
  Then I should see "Invalid login or password"
  
Scenario: blank username
  When I fill in "user_password" with "password1"
  And I press "Log In"
  Then I should see "Invalid login or password"
  
Scenario: blank password
  When I fill in "user_login" with "user1"
  And I press "Log In"
  Then I should see "Invalid login or password"

Scenario: I try to access the homepage without logging in
  When I go to the home page
  Then I should be on the Login page