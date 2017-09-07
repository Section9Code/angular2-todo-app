# Capybara configuration
Capybara.configure do |config|
  config.run_server = false
  config.default_selector = :css
  config.exact = true
  config.default_max_wait_time = 5
  config.ignore_hidden_elements = false
end

# The default driver is passed to BROWSER which can then be set on the cmd line like in the example below
Capybara.default_driver = case ENV['BROWSER']
                            when 'chrome'
                              :chrome
                            when 'chrome_headless'
                              :chrome_headless
                            when 'firefox'
                              :firefox
                            else
                              raise 'Please choose one of the following: chrome or firefox. For example BROWSER=chrome'
                          end

# Register the different types of browsers we require
Capybara.register_driver :chrome do |app|
  puts 'Running using Chrome'
  Capybara::Selenium::Driver.new(app, :browser => :chrome,
                                 :options => Selenium::WebDriver::Chrome::Options.new(:args => %w[--screen-size=1366,768]))
  end

Capybara.register_driver :chrome_headless do |app|
  puts 'Running using Chrome Headless'
  Capybara::Selenium::Driver.new(app, :browser => :chrome,
                                 :options => Selenium::WebDriver::Chrome::Options.new(:args => %w[headless]))
end

Capybara.register_driver :firefox do |app|
  puts 'Running using Firefox'
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.native_events = true
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end
