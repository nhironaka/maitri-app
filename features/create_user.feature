Feature: create a user
  
  As a user
  So that I can create another user
  I want to be able to give access to another user
  
Background: users in database
  
  And the following users exist:
    | username                | password    | email                | password_confirmation |
    | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  And I am logged in
  And I am on the sign up page
  
Scenario: create legitimate user
  When I fill in "user_username" with "newuser"
  And I fill in "user_password" with "newuserpassword"
  And I fill in "user_email" with "newuser@gmail.com"
  And I fill in "user_password_confirmation" with "newuserpassword"
  And I press "Sign Up"
  Then I should be on the home page
  
Scenario: create user that already exists
  When I fill in "user_username" with "existuser"
  And I fill in "user_password" with "existuser1"
  And I fill in "user_email" with "existuser1@gmail.com"
  And I fill in "user_password_confirmation" with "existuser1"
  And I press "Sign Up"
  Then I should see "Username has already been taken"
  
Scenario: blank username
  When I fill in "user_password" with "password1"
  And I press "Sign Up"
  Then I should see "Username can't be blank"
  
Scenario: blank password
  When I fill in "user_username" with "userone"
  And I press "Sign Up"
  Then I should see "Password can't be blank"
  