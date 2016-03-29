Feature: filter a list of patients
 
  As a user
  So that I can filter the list of patients
  I want to be able to see patients based on my filtered results

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
  And I press "Filter"

Scenario: filter by checkboxes
  When I uncheck "demographic_fields_form"
  And I check "Name"
  And I check "Gender"
  #And I uncheck "Start Date"
  #And I uncheck "End Date"
  And I press "OK"
  Then I should see "Name"
  And I should see "Gender"
  And I should not see "Start Date"
  And I should not see "End Date"
  
Scenario: filter everything
  When I uncheck "demographic_fields_form"
  #When I uncheck "Name"
  #When I uncheck "Gender"
  #And I uncheck "Start Date"
  #And I uncheck "End Date"
  And I press "OK"
  Then I should not see "Name"
  And I should not see "Gender"
  And I should not see "Start Date"
  And I should not see "End Date"

Scenario: select all checkboxes you
  When I check "demographic_fields_form"
  And I press "OK"
  Then I should see "Name"
  And I should see "Gender"
  And I should see "Start Date"
  And I should see "End Date"
  
Scenario: press reset after filtered page
  When I press "Filter"
  And I uncheck "demographic_fields_form"
  And I check "Name"
  And I check "Gender"
  And I uncheck "Start Date"
  And I uncheck "End Date"
  And I press "OK"
  And I press "Reset"
  Then I should see "Name"
  And I should see "Gender"
  And I should see "Start Date"
  And I should see "End Date"
  