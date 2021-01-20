require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'faker'

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)

# end

# Capybara.default_driver = :selenium
# Capybara.default_max_wait_time = 15
# Capybara.page.driver.browser.manage.window.maximize
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 15
end


case ENV["BROWSER"]
when "safari"
  @driver = :selenium_safari
when "chrome"
  @driver = :selenium_chrome
when "headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.add_argument "--headless"
      opts.add_argument "--disable-gpu"
      opts.add_argument "--no-sandbox"
      opts.add_argument "--disable-site-isolation-trials"
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome
else
  puts "Invalid browser"
end