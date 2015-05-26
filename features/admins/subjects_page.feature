@admin_subject
Feature: Subject page
  As an admin of the page
  I want to be able to read, create, update and delete subject
  
  Background:
    Given I have signin as an admin
    
  Scenario: New subject page
    Given I visit new subject page
    Then I should see a form with title "New Subject"
    
  Scenario: Create subject with valid data
    Given I visit new subject page
    When I fill the form with "java" and "40" and click "Create"
    Then I should see a message "Successfully created subject"
    And one subject with name "java" added to the database
    
  Scenario: Create subject with invalid data
    Given I visit new subject page
    When I fill the form with "java" and "abc" and click "Create"
    Then the page should contain element with id "error_explanation"
    And no subject added to the database
    
  Scenario: update with valid data
    Given there is a subject in the database with name "java" and duration "20"
    When I visit edit subject page
    And I change name to "Ruby"
    And click "Update" button
    Then I should see a message "Successfully updated subject!"
    And subject should have name "Ruby"
  
  Scenario: Update with invalid data
    Given there is a subject in the database with name "java" and duration "20"
    When I visit edit subject page
    And I change duration to "abc"
    And click "Update" button
    Then the page should contain element with id "error_explanation"
    And subject should stay the same
    
  Scenario: Show all subjects
    Given I have subject as bellow:
      | name | duration |
      | Java | 20       |
      | Ruby | 10       |
      | C++  | 40       |
    When I visit subject index page
    Then the page should have 3 subject listing
  
  Scenario: Show one subject
    Given there is a subject in the database with name "java" and duration "20"
    When I visit subject show page
    Then I should see page with content name "java" duration "20"
    
  Scenario: Delete subject
    Given there is a subject in the database with name "java" and duration "20"
    When I visit index page
    Then I click on "Delete" link Subject should decrease by 1
