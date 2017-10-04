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

When(/^I mark the todo as "([^"]*)"$/) do |state|
  todo.base.completed.first.click
  case state
    when 'complete'
      expect(todo.base.completed.first.selected?).to be true
    when 'incomplete'
      expect(todo.base.completed.first.selected?).to be false
  end
end

Then(/^the todo should change state to reflect the fact it is completed$/) do
  expect(todo.base.completed_items.count).to eq(1)
end

And(/^there is a completed todo in the list$/) do
  steps %q{
          * I create a todo for "expenses"
          * I mark the todo as "complete"
        }
end

Then(/^the todo should change state to reflect the fact it is incomplete$/) do
  expect(todo.base.completed_items.count.zero?).to be true
end

When(/^I create "([^"]*)" todo's$/) do |number|
  i = 0
  while i < number.to_i
    todo.base.new_todo.send_keys("#{FigNewton.todo_list[i]}", :enter)
    expect(todo.base.items.last.text).to eq(FigNewton.todo_list[i])
    i += 1
    sleep 0.5
  end
end

Then(/^I should see "([^"]*)" todo's in the list$/) do |number|
  expect(todo.base.todos.length).to eq(number.to_i)
  expect(todo.base.todo_count.text[/\d/].to_i).to eq(number.to_i)
end

# Then(/^I should see "([^"]*)" in the footer$/) do |arg1|
#   expect(todo.base.todo_count.text).to eq(arg1)
# end
