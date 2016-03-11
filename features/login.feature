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
  When I fill in "username_or_email" with "existuser"
  And I fill in "login_password" with "existuser1"
  And I press "Login"
  Then I should be on the patient overview page
  
Scenario: login user that does not exist
  When I fill in "username_or_email" with "invalid"
  And I fill in "login_password" with "invalid"
  And I press "Login"
  Then I should see "Invalid username or password"
  
Scenario: blank username
  When I fill in "login_password" with "password1"
  And I press "Login"
  Then I should see "Please enter a username"
  
Scenario: blank password
  When I fill in "username_or_email" with "user1"
  And I press "Login"
  Then I should see "Please enter a password"
  