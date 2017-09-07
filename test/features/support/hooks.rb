After do |scenario|
  # Captures a screenshot should the Scenario fail and embeds it in the html report
  if scenario.failed?
    dir = "#{FigNewton.screenshots_dir}#{scenario.name}.png"
    page.driver.browser.save_screenshot(dir) unless File.exist?(dir)
    embed(File.expand_path("#{FigNewton.screenshots_dir}#{scenario.name}.png"), 'image/png', 'screenshot')
  else
    # Resets the session
    Capybara.reset!
    sleep 0.3
  end
end
