# By placing the Amazon class in a method it is easy to daisy chain calls together i.e. amazon.login
module App
  def todo
    Todo.new
  end
end

World(App)
