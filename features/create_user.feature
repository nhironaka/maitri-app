Feature: create a user
  
  As a user
  So that I can create another user
  I want to be able to give access to another user
  
Background: users in database
  
  Given the following users exist:
  | username                | password    | email               |
  | duplicate               | duplicate   | duplicate@gmail.com |

  And I am on the Create page
  
Scenario: create legitimate user
  When I fill in user with "user1"
  And I fill in password with "password1"
  And I press "Submit"
  Then I should see "Success, user has been created!"
  
Scenario: create user that already exists
  When I fill in user with "duplicate"
  And I fill in password with "duplicate"
  And I press "Submit"
  Then I should see "Username is already taken."
  
Scenario: blank username
  When I fill in password with "password1"
  And I press "Submit"
  Then I should see "Please enter username"
  
Scenario: blank password
  When I fill in user with "user1"
  And I press "Submit"
  Then I should see "Please enter password"
  