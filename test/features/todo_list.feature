Feature: Todo list
  As a user
  I want to create, update and delete todo's
  So that I can organise my work

  Scenario: The one where we create a todo
    Given I am on the todo list page
    When I create a todo for "expenses"
    Then I should see that todo in my list

  Scenario: The one where we delete a todo
    Given I am on the todo list page
    And I have created a todo
    When I delete that todo
    Then it should no longer be visible in my list

  Scenario: The one where we complete a todo
    Given I am on the todo list page
    And I have created a todo
    When I complete that todo
    Then the todo should change state to reflect the fact it is completed

