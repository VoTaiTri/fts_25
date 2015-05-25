@admin_question
Feature: Question page
  As an admin of the page
  I want to be able to read, create, update and delete question with options
  
  Background:
    Given I have signin as an admin
    And I have subject as follow:
      | name | duration |
      | Java | 20       |
      | Ruby | 10       |
      | C++  | 40       |
    
  Scenario: New question page
    Given I visit new question page
    Then I should see a form with title "New Question"
  
  Scenario: Add Option link
    Given I visit new question page
    When I click on "Add option"
    Then the page should have textbox and link "Remove Option"
    
  Scenario: Create question with valid data
    Given I visit new question page
    When I choose subject "Java"
    And fill in description "description"
    And click "Create"
    Then I should see a message "Successfully created question"
    And one question with description "description" added to the database
    
  Scenario: Create question with invalid data
    Given I visit new question page
    When I choose subject "Java"
    And fill in description ""
    And click "Create"
    Then the page should contain element with id "error_explanation"
    And no question added to the database
    
  Scenario: update with valid data
    Given there is a question with description "description"
    When I visit edit question page
    And I change description to "Test description"
    And click "Update" button
    Then I should see a message "Successfully updated question!"
    And question should have description "Test description"
  
  Scenario: update with invalid data
    Given there is a question with description "description"
    When I visit edit question page
    And I change description to ""
    And click "Update" button
    Then the page should contain element with id "error_explanation"
    And subject should stay the same
    
  Scenario: Show all question
    Given I have question as bellow:
      | description |
      | question1   |
      | question2   |
      | question3   |
    When I visit question index page
    Then the page should have 3 question listing
  
  Scenario: Show one question
    Given there is a question with description "description" and 4 options
    When I visit question show page
    Then I should see page with content description "description"
    And the page should contain 4 options data
    
  Scenario: Delete question
    Given there is a question with description "delete description"
    When I visit index page
    And click on "Delete" link
    Then one question should be delete from the database
