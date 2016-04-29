Feature: show a patient profile
 
  As a user
  So that I can view the profile of a patient to see more background information on them
  I want to be able to see more patient information

Background: patients are already in the database
  
  Given the following patients exist:
    |  name             |  gender |  start_date |  end_date |
    |  Prince           |  M      | 01-04-2000  | 07-11-2002 |
    |  Fifth            |  F      | 2005-03-04  | 2007-12-12 |
  And the following users exist:
    | username                | password    | email                | password_confirmation |
    | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  And I am logged in
  And I am on the patient overview page

Scenario: follow patient name
  When I follow "Prince"
  Then I should see "RESIDENT INFORMATION"
  Then I should see "ADDITIONAL CLINICAL DATA"

Scenario: follow RESIDENT INFORMATION
  When I follow "Fifth"
  Then I follow "RESIDENT INFORMATION"
  Then I should see "Start Date 2005-03-04"
  Then I should see "End Date 2007-12-12"
  Then I should see "RESIDENT INFORMATION"
  Then I should see "ADDITIONAL CLINICAL DATA"
  
