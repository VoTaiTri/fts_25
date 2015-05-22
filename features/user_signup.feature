@signup
Feature: User signup
  
  Scenario: Signup with valid data
    Given I visit signup page
    When I fill in the form like follow and click "Sign up":
      | username              | Test            |
      | email                 | abc@example.com |
      | password              | password        |
      | password_confirmation | password        |
    Then I should see the message say "Welcome! You have signed up successfully."
    And I should have an account
    
  Scenario: Signup with invalid data
    Given I visit signup page
    When I fill in the form like follow and click "Sign up":
      | username              | Test           |
      | email                 | abcexample.com |
      | password              | password12     |
      | password_confirmation | password       |
    Then the page should have element with id "error_explanation"
