require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'faker'


case ENV["BROWSER"]
  when "chrome"
    Capybara.default_driver = :chrome
    Capybara.register_driver :chrome do |app|
    options = {
    :js_errors => false,
    :timeout => 360,
    :debug => false,
    :inspector => false,
    }
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  Capybara.page.driver.browser.manage.window.maximize
 
  when "safari"
    Capybara.default_driver = :safari
    Capybara.register_driver :safari do |app|
    options = {
    :js_errors => false,
    :timeout => 360,
    :debug => false,
    :inspector => false,
    }
    Capybara::Selenium::Driver.new(app, :browser => :safari)
  end
  Capybara.page.driver.browser.manage.window.maximize
 
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
  @driver = :selenium_chrome_headless
  else
    puts "Invalid browser"
  end
