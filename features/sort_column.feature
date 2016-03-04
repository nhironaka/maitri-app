Feature: show a list of patients sorted by various columns
 
  As database managers
  So that we can easily see a list of patients and their information
  We want to see  and be able to sort by their name,  date of birth and disease

Background: patients are already in the database
  
  Given the following patients exist:
  | Name                    | Gender |  Start Date  |
  | Toni T                  | M      | 12-01-1991   |
  | Cal H                   | M      | 11-12-1993   |
  | Aari L                  | F      | 10-13-1900   |
  | Steven Li               | M      | 9-12-1993    |
  | Erika White             | F      | 7-4-1864     |
  | Beyonce Knowles         | F      | 2-1-2009     |
  
  And I am on the patient overview page

Scenario: sort by patient name 
  When I follow "Name"
  Then I should see "Aari" before "Beyonce Knowles"
  And  I should see "Beyonce Knowles" before "Cal H"
  And  I should see "Cal H" before "Erika White"
  And  I should see "Erika White" before "Steven Li"
  And  I should see "Steven Li" before "Toni T"
  

Scenario: sort by start date
  When I follow "Start Date"
  Then I should see "Erika White" before "Toni T"
  And I should see "Steven Li" before "Cal H"
  And I should see "Cal H" before "Beyonce Knowles"

Scenario: sort by Gender
  When I follow "Gender"
  Then I should see "M" before "F"
  