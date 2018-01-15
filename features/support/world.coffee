seleniumWebdriver = require('selenium-webdriver')
{defineSupportCode} = require('cucumber')

CustomWorld = () ->
  @driver = new seleniumWebdriver.Builder()
    .forBrowser('phantomjs')
    .build()
  return

defineSupportCode ({setWorldConstructor}) ->
  setWorldConstructor(CustomWorld)
  return
