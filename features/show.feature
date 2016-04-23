Feature: show a patient profile
 
  As a user
  So that I can view the profile of a patient to see more background information on them
  I want to be able to see more patient information

Background: patients are already in the database
  
  Given the following users exist:
    | username                | password    | email                | password_confirmation |
    | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  And I am logged in
  And I am on the patient overview page

Scenario: follow patient name
  When I follow "Violet"
  Then I should see "RESIDENT INFORMATION"
  Then I should see "ADDITIONAL CLINICAL DATA"
  Then I should see "ADDITIONAL RESIDENT INFORMATION"
  Then I should see "MEDICATION ORDERS"
  Then I should see "MISC. NOTES"
  
Scenario: follow RESIDENT INFORMATION
  When I follow "Tyler"
  Then I follow "RESIDENT INFORMATION"
  Then I should see "Start Date 1991-01-12 00:00:00 UTC"
  Then I should see "End Date 1992-01-31 00:00:00 UTC"
  Then I should see "RESIDENT INFORMATION"
  Then I should see "ADDITIONAL CLINICAL DATA"
  Then I should see "ADDITIONAL RESIDENT INFORMATION"
  Then I should see "MEDICATION ORDERS"
  Then I should see "MISC. NOTES"
  
