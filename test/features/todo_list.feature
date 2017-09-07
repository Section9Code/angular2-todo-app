Feature: Todo list
  As a user
  I want to create, update and delete todo's
  So that I can organise my work

  Background: The one where we navigate to the todo page
    Given I am on the todo list page

  Scenario: The one where we create a todo
    When I create a todo for "expenses"
    Then I should see that todo in my list

  Scenario: The one where we delete a todo
    And I have created a todo
    When I delete that todo
    Then it should no longer be visible in my list

  Scenario: The one where we complete a todo
    And I have created a todo
    When I mark the todo as "complete"
    Then the todo should change state to reflect the fact it is completed

  Scenario: The one where we mark a completed todo as incomplete
    And there is a completed todo in the list
    When I mark the todo as "incomplete"
    Then the todo should change state to reflect the fact it is incomplete

  Scenario Outline: The one where we add multiple todo's to the list
    When I create "<number>" todo's
    Then I should see "<number>" todo's in the list
    Examples:
      | number |
      | 2      |
      | 4      |
      | 7      |
