@admin_examination
Feature: Examination page
  As an admin of the page
  I want to be able to view and correct examination
  
  Background:
    Given I have signin as an admin
    And there are some examination took by the user
    | subject | user  |
    | Java    | Norin |
    | Ruby    | Elit  |
    
  Scenario: correct examination
    Given I visit correction page
    And I mark some answer as correct
    And click "Submit" button
    Then examination should change status to "Corrected"
    And I should see a message "Successfully updated examination!"
    
  Scenario: Show all examinations
    Given I visit examination index page
    Then the page should show examination subject name
    And "Go to Correction Page" link
  
  Scenario: Show one subject
    Given I visit first examination show page
    Then I should see page with content "Norin's examination result"
