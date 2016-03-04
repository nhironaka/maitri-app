Feature: see data in the overview page
  
  As a user
  So that I can add data to the database
  I want to be able to transfer data from an excel file to the database
  
Background: users in database
  
  Given the following data exists:
    Name, Gender, Date
    Toni T                  , M      , 12-01-1991   ,
    Cal H                   , M      , 11-12-1993   ,
    Aari L                  , F      , 10-13-1900   ,
    Steven Li               , M      , 9-12-1993    ,
    Erika White             , F      , 7-4-1864     ,
    Beyonce Knowles         , F      , 2-1-2009     ,

  When I am on the Login page
  And I press "Log In"
  Then I should be redirected into "Overview"
  And I should see "Name" within "Patient Table"
