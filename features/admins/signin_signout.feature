@admin_signin_signout
Feature: User signin and signout
  As an admin of the site
  I want to be able to signin and signout
  In order to start using the site to manage data
  
  Background:
    Given I have an admin account as follow:
      | username              | Norin             |
      | email                 | admin@example.com |
      | password              | secret123         |
      | password_confirmation | secret123         |
      | role                  | admin             |

  Scenario Outline: attempt to signin
    Given I visit admin signin page
    When I fill in my "<email>", "<password>" and click "Sign in"
    Then I should see message "<message>"
    
    Examples: Invalid data
      | email             | password  | message                    |
      | admin@example.com | secret    | Invalid email or password. |
      | admin@abc.com     | secret123 | Invalid email or password. |
    
    Examples: Valid data
      | email             | password  | message                 |
      | admin@example.com | secret123 | Signed in successfully. |
      
  Scenario: attempt to signout
    Given I have already signed in with:
      | email    | admin@example.com |
      | password | secret123         |
    When I click on "Sign Out" link
    Then I should see message say "Signed out successfully."
