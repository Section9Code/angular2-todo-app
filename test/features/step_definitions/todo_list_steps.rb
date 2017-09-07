Given(/^I am on the todo list page$/) do
  todo.base.load
end

When(/^I create a todo for "([^"]*)"$/) do |item|
  @item = item
  todo.base.new_todo.send_keys("#{@item}", :enter)
end

Then(/^I should see that todo in my list$/) do
  expect(todo.base.todo_count.text[/\d/].to_i).to eq(todo.base.todos.length)
end

Given(/^I have created a todo$/) do
  step "I create a todo for \"expenses\""
end

When(/^I delete that todo$/) do
  todo.base.todos.first.hover
  todo.base.delete.first.click
end

Then(/^it should no longer be visible in my list$/) do
  expect(todo.base.todos.count.zero?).to be true
  expect(todo.base.items.count.zero?).to be true
end

When(/^I complete that todo$/) do
  todo.base.completed.first.click
  expect(todo.base.completed.first.selected?).to be true
end

Then(/^the todo should change state to reflect the fact it is completed$/) do
  expect(todo.base.completed_items.count).to eq(1)
end
