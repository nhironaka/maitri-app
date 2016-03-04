Feature: login as a user
  
  As a user
  So that I can login as a user
  I want to be able to access the homepage

Background: users in database
  
  Given the following users exist:
  | username                | password    |
  | user1                   | password1   |

  And I am on the Login page
  
Scenario: login legitimate user
  When I fill in user with "user1"
  And I fill in password with "password1"
  And I press "Submit"
  Then I should be on the patient overview page
  
Scenario: login user that does not exist
  When I fill in user with "invalid"
  And I fill in password with "invalid"
  And I press "Submit"
  Then I should see "Invalid User"
  
Scenario: blank username
  When I fill in password with "password1"
  And I press "Submit"
  Then I should see "Please enter username"
  
Scenario: blank password
  When I fill in user with "user1"
  And I press "Submit"
  Then I should see "Please enter password"
  