@admin_user
Feature: User page
  As an admin of the page
  I want to be able to view and delete user
  
  Background:
    Given I have signin as an admin
    And there are some users who have registered as follow:
      | username | email             |
      | Norin    | norin@example.com |
      | user1    | user1@example.com |
      | user2    | user2@example.com |
    
  Scenario: Show all users
    Given I visit user index page
    Then the page should have a list of user name
    And "Delete" link
  
  Scenario: Show one user
    Given I visit first user show page
    Then I should see page with content username and email
    And a list of examination histories
    
  Scenario: Delete a user
    Given I visit user index page
    When I click on "Delete" link User should decrease by 1
