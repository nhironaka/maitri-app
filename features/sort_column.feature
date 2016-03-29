Feature: show a list of patients sorted by various columns
 
  As a user
  So that we can easily see a list of patients and their information
  We want to see  and be able to sort by their name,  date of birth and disease

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

Scenario: sort by patient name 
  When I follow "Name"
  Then I definitely should see "Aari L" before "Steven Li"
  And  I definitely should see "Beyonce Knowles" before "Cal H"
  And  I definitely should see "Cal H" before "Erika White"
  And  I definitely should see "Erika White" before "Steven Li"
  And  I definitely should see "Steven Li" before "Toni T"
  

Scenario: sort by start date
  When I follow "Start Date"
  Then I definitely should see "Erika White" before "Toni T"
  And I definitely should see "Steven Li" before "Cal H"
  And I definitely should see "Aari L" before "Cal H"

Scenario: sort by Gender
  When I follow "Gender"
  Then I definitely should see "M" before "F"
  
Scenario: sort by patient name
  When I follow "Name"
  Then I definitely should not see "Steven Li" before "Erika White"
  And  I definitely should not see "Toni L" before "Cal H"
  And  I definitely should not see "Cal H" before "Aari L"
  