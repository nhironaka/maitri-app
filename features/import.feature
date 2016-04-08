Feature: import patient data from excel into database
	As a user
  So that I can generate reports using the new patient data
  I want to integrate new patient data into the existing one
    
Background: patients are already in the database
  
  Given the following patients exist:
    |  Name             |  Gender |  start_date |  end_date |
    |  Toni T           |  M      | 12-01-1991  | 31-01-1992 |
    |  Cal H            |  M      | 11-12-1993  | 14-03-1996 | 
  And the following users exist:
    | username                | password    | email                | password_confirmation |
    | existuser               | existuser1  | existuser1@gmail.com | existuser1            |
  And I am logged in
  And I am on the patient overview page
  And I click on import
  Then I should see select file

Scenario: I should see updated information and the old information should be gone
  When I select a file # file contains: (Last Name, First Name, ….) With patients “Patient New”
  And I press import
  Then I should not see Toni T
  And I should see Patient New

Scenario: I try to import a non-xlsx file type
  When I select FileX
  And I press import 
  Then I should see “File type must be an Excel”