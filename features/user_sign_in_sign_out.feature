Feature: User signin and signout
  As user
  I want to able to sign in and sign out

  Scenario Outline: Log in
    Given I have existing account as follow:
      | email                 | admin@gmail.com |
      | password              | 12345678        |
      | password_confirmation | 12345678        |
      And I visit login page
    When I fill in "<email>", "<password>" and click "Log In"
    Then I should see message say "<message>"
      And I visit home page

    Examples: Invalid data
      | email             | password | message                   |
      | admin@gmail.com   | 123456789| Invalid email or password |
      | normal@gmail.com  | password | Invalid email or password |  

    Examples: Valid data
      | email             | password | message                   |
      | admin@gmail.com   | 12345678 | Signed in successfully    |

  Scenario: Log out
    Given I want to log out
