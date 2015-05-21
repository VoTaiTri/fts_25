@signin_signout
Feature: User signin and signout
  As a user who want to use the site
  I want to be able to signin and signout
  In order to start taking examinations
  
  Background:
    Given I have an existing account as follow:
      | username              | Norin             |
      | email                 | norin@example.com |
      | password              | secret123         |
      | password_confirmation | secret123         |

  Scenario Outline: attempt to signin
    Given I visit signin page
    When I fill in "<email>", "<password>" and click "Sign in"
    Then I should see message say "<message>"
    
    Examples: Invalid data
      | email             | password  | message                    |
      | norin@example.com | secret    | Invalid email or password. |
      | norin@abc.com     | secret123 | Invalid email or password. |
    
    Examples: Valid data
      | email             | password  | message                 |
      | norin@example.com | secret123 | Signed in successfully. |
      
  Scenario: attempt to signout
    Given I have already signed in with:
      | email    | norin@example.com |
      | password | secret123         |
    When I click on "Sign Out" link
    Then I should see message say "Signed out successfully."
    