Feature: logout as a user
  
  As a user
  So that I can logout as a user
  I want to be able to logout and go back to the login page

Background: users in database
  
  Given the following users exist:
  | username                | password    | email                | password_confirmation |
  | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  
  And I am on the Login page
  And I fill in "username_or_email" with "existuser"
  And I fill in "login_password" with "existuser1"
  And I press "Login"
  
Scenario: logout user
  When I press "Logout"
  Then I should be on the Login page
  