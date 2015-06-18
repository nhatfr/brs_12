Feature: Manage Books
  As admin
  I want to create and manager books

  Background:
    Given a admin account as follow:
      | email                 | admin@gmail.com|
      | password              | 12345678       |
      | password_confirmation | 12345678       |
      | role                  | admin          |
    And I logged in with email: "admin@gmail.com" and password: "12345678" as Admin

  Scenario Outline: Books List
    Given I have books titled "Ekko", "Morgana"
    When I go to list of books
    Then I should see "Ekko"
      And I should see "Morgana"

    Examples:
    | Title   | Author   | Description                           |
    | Ekko    | GodZilla | this is some characters I usually use |
    | Morgana | GodZilla | this is some characters I usually use |

  Scenario: Create Valid Book
    Given I have a category named "aut"
      And I have no books
      And I am on the list of books
    When I click "New Book"
      And I fill in "book_title" with "leblance"
      And I fill in "book_author" with "GodZilla"
      And I chose in "Category" with "aut"
      And I click "Create" button
    Then I return index book page
      And I should see "leblance"
      And I should see "GodZilla"
      And I should have 1 book

    Scenario: Edit a book
      Given I am on list of books
        And I have a book
      When I click edit book link
        And I fill in "book_title" with "Shen"
        And I fill in "book_ISBN" with "98989kd"
      When I click "Update" button
      Then I should see "Shen"
