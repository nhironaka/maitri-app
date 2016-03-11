Feature: create a user
  
  As a user
  So that I can create another user
  I want to be able to give access to another user
  
Background: users in database
  
  Given the following users exist:
  | username              | password    | email                | password_confirmation |
  | duplicate1            | duplicate1  | duplicate1@gmail.com | duplicate1            |

  And I am on the Create page
  
Scenario: create legitimate user
  When I fill in "user_username" with "newuser"
  And I fill in "user_password" with "newuserpassword"
  And I fill in "user_email" with "newuser@gmail.com"
  And I fill in "user_password_confirmation" with "newuserpassword"
  And I press "Signup"
  Then I should be on the patient overview page
  
Scenario: create user that already exists
  When I fill in "user_username" with "duplicate1"
  And I fill in "user_password" with "duplicate1"
  And I fill in "user_email" with "duplicate1@gmail.com"
  And I fill in "user_password_confirmation" with "duplicate1"
  And I press "Signup"
  Then I should see "Username has already been taken"
  
Scenario: blank username
  When I fill in "user_password" with "password1"
  And I press "Signup"
  Then I should see "Username can't be blank"
  
Scenario: blank password
  When I fill in user with "user1"
  And I press "Signup"
  Then I should see "Password can't be blank"
  