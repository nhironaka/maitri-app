Feature: filter a list of patients
 
  As a user
  So that I can see patient trends more clearly (such as number of M and F, number of peopl from a certain hospital, etc)
  I want to be able to create a demographics report

Background: patients are already in the database
  Given I am logged in
  And I am on the patient overview page
  
Scenario: Create a demographics report
  When I press "/patients/reports"
  Then I should see "Reports"
  When I press "Generate Demographics Report"
  Then I should see "Download"
  When I press "Download"
  Then I should get a download with the filename "Demographics_Report.pdf"