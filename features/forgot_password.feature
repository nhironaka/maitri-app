Feature: allow a user to reset password if they forgot password 
  As a user
  So that I can reset my password if I forgot it
  I want to be reset my password so I can login with the new password

Scenario: Given I am a user and forgot my password
    Given I am a user and not logged in
    Then I should see forgot password link
    When I click on the forgot password link
    Then I should see a enter email field
    Then I should see reset password button
    When I press the reset password button
    Then I should see check your email text
