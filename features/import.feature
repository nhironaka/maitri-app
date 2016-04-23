Feature: import patient data from excel into database
 As a user
 So that I can easily import data from excel into the database in order to keep up to date patients in the system and remove the old ones
 I want to see all the patient data from the excel sheet in the patients overview page

Background: patients are already in the database
  
  Given the following patients exist:
    |  name             |  gender |  start_date |  end_date |
    |  Toni T           |  M      | 12-01-1991  | 31-01-1992 |
    |  Cal H            |  M      | 11-12-1993  | 14-03-1996 | 
   And the following users exist:
    | username                | password    | email                            | password_confirmation |
    | existuser                  | existuser1  | existuser1@gmail.com | existuser1                      |
  And I am logged in
  And I am on the patient overview page
  And I follow "Import"
  Then I should be on the import page
  And I should see "Please select an Excel sheet"

Scenario: import new patients through excel
    When I attach the file "/path/to/Violet test report- Resident Information.xlsx" to "file"
    And I press "import_button"
    Then I should not see "Toni T"
    And I should see "Violet"

Scenario: import a non-xlsx file type
    When I attach the file "/path/to/File.pdf" to "file"
    And I press "import_button" 
    Then I should see "File type must be an Excel"

Scenario: import a non-xlsx file type
    When I upload a non-Excel file
    And I press "Import" 
    Then I should see "File type must be an Excel"

