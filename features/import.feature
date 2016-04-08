Feature: import patient data from excel into database
 As a user
 So that I can easily import data from excel into the database
 I want to see all the patient data from the excel sheet in the patients overview page

Background: patients are already in the database
  
  Given the following patients exist:
    |  Name             |  Gender |  start_date |  end_date |
    |  Toni T           |  M      | 12-01-1991  | 31-01-1992 |
    |  Cal H            |  M      | 11-12-1993  | 14-03-1996 | 
   And the following users exist:
    | username                | password    | email                            | password_confirmation |
    | existuser                  | existuser1  | existuser1@gmail.com | existuser1                      |
  And I am logged in
  And I am on the patient overview page
  And I click on import
  Then I should see "Select file"

Scenario: import new patients through excel
    When I select "Patients.xlsx" # file contains: (Last Name, First Name, ….) With patients “Patient New”
    And I press import
    Then I should not see "Toni T"
    And I should see "Patient New"

Scenario: import a non-xlsx file type
    When I select "FileX.pdf"
    And I press import 
    Then I should see "File type must be an Excel"

Scenario: import without selecting a file
   When I press import
   Then I should see "You must select a file"