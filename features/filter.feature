Feature: filter a list of patients
 
  As a user
  So that I can filter the list of patients
  I want to be able to see patients based on my filtered results

Background: patients are already in the database
  
  Given the following patients exist:
    |  name             |  gender |  start_date |  end_date  |
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
  And I press "filter_button"

Scenario: filter by checkboxes
  When I uncheck "demographic_fields_form"
  And I uncheck "First Name"
  And I uncheck "Gender"
  And I press "OK"
  Then the following should be hidden: "First_Name"
  And the following should be hidden: "Gender"
  
Scenario: filter everything
  When I uncheck "demographic_fields_form"
  And I press "OK"
  Then the following should be hidden: "First_Name"
  And the following should be hidden: "Gender"
  And the following should be hidden: "Residency_Start"
  And the following should be hidden: "Residency_End"

Scenario: select all checkboxes you
  When I check "demographic_fields_form"
  And I press "OK"
  Then I should see "First Name"
  And I should see "Gender"
  And I should see "Residency Start"
  And I should see "Residency End"
  
Scenario: press reset after filtered page
  When I press "Filter"
  And I check "First Name"
  And I check "Gender"
  And I uncheck "Residency Start"
  And I uncheck "Residency End"
  And I press "OK"
  Then the following should be hidden: "Residency_Start"
  When I press "Reset"
  Then I should see "First Name"
  And I should see "Gender"
  And I should see "Residency Start"
  And I should see "Residency End"
  