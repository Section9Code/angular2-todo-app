# This is initial route into each section and where the url is loaded from
class BasePage < SitePrism::Page
  set_url "#{FigNewton.base_url}"

  element :new_todo, '.new-todo'
  element :todo_count, '.todo-count'
  elements :todos, '.view'
  elements :completed, '.toggle'
  elements :items, 'label'
  elements :delete, '.destroy'
  elements :completed_items, '.completed label'
end
