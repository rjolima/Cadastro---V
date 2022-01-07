require "capybara"
require "capybara/cucumber"
require "faker"
require "cpf_faker"
require 'allure-cucumber'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    #config.default_driver = :selenium
    config.app_host = "https://getnada.com/"
end

# Allure.configure do |config|
#     c.results_directory = 'allure-results'
#     c.clean_results_directory = true
# end