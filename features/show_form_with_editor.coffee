seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until

defineSupportCode ({Then}) ->
  Then 'I should see {string} editor', (cssSelector) ->
    condition = Until.elementLocated css: ".#{cssSelector}"
    @driver.wait(condition)
