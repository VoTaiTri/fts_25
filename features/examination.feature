@examination
Feature: examination
  As a user who use website
  I want to be able to take examination
  
  Background:
    Given we have subjects like follow:
    | name | duration |
    | Java | 20       |
    | Ruby | 30       |
    | C++  | 40       |
    
  Scenario: None sign in user
    When I visit examination page
    Then I should see message say "You need to sign in or sign up before continuing."
    
  Scenario: Sigined in user
    Given I have already signed in
    When I visit examination page
    Then I should see header with text "All Examinations" and button "Start"
    When I choose a subject and click "Start"
    Then I should see an examination with "Start" link
    