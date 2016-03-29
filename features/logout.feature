Feature: logout as a user
  
  As a user
  So that I can logout as a user
  I want to be able to logout and go back to the login page

Background: users in database
  
  Given the following users exist:
  | username                | password    | email                | password_confirmation |
  | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  
  And I am logged in
  
Scenario: logout user
  When I follow "Log Out"
  Then I should be on the Login page
  