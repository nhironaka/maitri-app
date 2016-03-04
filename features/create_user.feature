Feature: create as a user
  
  As a user
  So that I can create another user
  I want to be able to give access to another user
  
Scenario: create legitimate user
  When I go to the create page
  And I fill in user with "user1"
  And I fill in password with "password1"
  And I press "Submit"
  Then I should see "Success"
  
Scenario: login user that does not exist
  When I go to the login page
  And I fill in user with "invalid"
  And I fill in password with "invalid"
  And I press "Submit"
  Then I should see "Invalid User"
  
Scenario: blank username
  When I go to the login page
  And I fill in password with "invalid"
  And I press "Submit"
  Then I should see "Please enter username"
  
Scenario: blank password
  When I go to the login page
  And I fill in user with "invalid"
  And I press "Submit"
  Then I should see "Please enter password"
  