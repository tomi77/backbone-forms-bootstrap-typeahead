seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until

defineSupportCode ({Given}) ->
  Given 'Show form', () ->
    # @driver.get "https://tomi77.github.io/backbone-forms-bootstrap-typeahead/"
    @driver.get "http://127.0.0.1:8000/"
    @driver.findElement css: '.container'
    .then Until.elementIsVisible.bind(Until)
    .then @driver.wait.bind(@driver)
