require 'capybara/rspec'

options = Selenium::WebDriver::Chrome::Options.new

Capybara.register_driver :headless_chrome do |app|
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1280,800')
  options.add_argument('--disable-dev-shm-usage')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    capabilities: [options]
  )
end

Capybara.javascript_driver = :headless_chrome
Capybara.server = :puma, { Silent: true }
Capybara.default_driver = :selenium
