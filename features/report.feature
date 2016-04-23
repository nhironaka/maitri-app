Feature: filter a list of patients
 
  As a user
  So that I can see patient trends more clearly (such as number of M and F, number of peopl from a certain hospital, etc)
  I want to be able to create a demographics report

Background: patients are already in the database
  Given the following patients exist:
    |  name             |  gender |  start_date |  end_date |
    |  Toni T           |  M      | 12-01-1991  | 31-01-1992 |
    |  Cal H            |  M      | 11-12-1993  | 14-03-1996 | 
  And I am logged in
  And I am on the reporting page
  Then I should see "Reports"
  
Scenario: Select patients whose name starts with a letter
  When I select "First Name" from "1th_filter"
  And I select "==" from "1th_condition"
  And I fill in "value1" with "T"
  And I press "OK"
  Then I should see "Toni"
  And I should not see "Cal"
  
Scenario: Select patients whose name is in a range
  When I select "First Name" from "1th_filter"
  And I select "<" from "1th_condition"
  And I fill in "value1" with "M"
  And I press "OK"
  Then I should not see "Toni"
  And I should see "Cal"

Scenario: Select patients whose name is in a range
  When I select "First Name" from "1th_filter"
  And I select ">" from "1th_condition"
  And I fill in "value1" with "M"
  And I press "OK"
  Then I should see "Toni"
  And I should not see "Cal"
  