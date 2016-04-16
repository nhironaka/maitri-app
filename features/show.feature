Feature: show a patient profile
 
  As a user
  So that I can view the profile of a patient to see more background information on them
  I want to be able to see more patient information

Background: patients are already in the database
  
  Given the following patients exist:
    |  Name             |  Gender |  start_date |  end_date |
    |  Toni T           |  M      | 12-01-1991  | 31-01-1992 |
    |  Cal H            |  M      | 11-12-1993  | 14-03-1996 | 
    |  Aari L           |  F      | 10-05-1999  | 02-09-2001 | 
    |  Steven Li        |  M      | 09-12-1993  | 10-04-1996 |
    |  Erika White      |  B      | 07-04-2000  | 12-11-2002 |
    |  Armando Fox      |  M      | 12-01-2004  | 01-11-2008 |
    |  Beyonce Knowles  |  F      | 09-12-2015  | 01-03-2016 | 
    |  Skinny Cow       |  F      | 03-03-2001  | 12-09-2001 | 
    |  Michael Fox      |  M      | 02-12-1993  | 10-11-1996 |
    |  Erika White      |  B      | 01-04-2000  | 07-11-2002 |
  And the following users exist:
    | username                | password    | email                | password_confirmation |
    | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  And I am logged in
  And I am on the patient overview page

Scenario: follow patient name
  When I follow "/patients/1"
  Then I should see "RESIDENT INFORMATION"
  Then I should see "ADDITIONAL CLINICAL DATA"
  Then I should see "ADDITIONAL RESIDENT INFORMATION"
  Then I should see "MEDICATION ORDERS"
  Then I should see "MISC. NOTES"
  
Scenario: follow RESIDENT INFORMATION
  When I follow "/patients/1"
  Then I follow "RESIDENT INFORMATION"
  Then I should see "Start Date 1991-01-12 00:00:00 UTC"
  Then I should see "End Date 1992-01-31 00:00:00 UTC"
  Then I should see "RESIDENT INFORMATION"
  Then I should see "ADDITIONAL CLINICAL DATA"
  Then I should see "ADDITIONAL RESIDENT INFORMATION"
  Then I should see "MEDICATION ORDERS"
  Then I should see "MISC. NOTES"
  
