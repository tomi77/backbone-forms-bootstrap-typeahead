seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, WebElementCondition, Condition} = seleniumWebdriver

defineSupportCode ({When, Then}) ->
  When 'Click on the {string} editor', (cssSelector) ->
    @driver.findElement By.className cssSelector
    .then (element) -> element.click()

  Then '{string} event is fired', (type) ->
    condition = new WebElementCondition '', (driver) ->
      driver.findElement By.className type
      .then (element) -> element.isDisplayed().then (v) -> if v then element else null
    @driver.wait(condition)

  When 'Leaving the editor', () ->
    @driver.findElement css: 'body'
    .then (element) -> element.click()

  When 'Select new state', () ->
    @driver.findElement css: '.bbf-bootstrap-typeahead'
    .then (element) -> element.sendKeys 'ala'
    .then () => @driver.wait Until.elementLocated By.xpath "//li[contains(., '<strong>Ala</strong>ska')]"
    .then () => @driver.findElement xpath: "//li[contains(., '<strong>Ala</strong>ska')]/a"
    .then (element) -> element.click()

  Then 'Change event is fired and show {string}', (new_val) -> @driver.wait Until.elementTextIs @driver.findElement(css: '.change .label'), new_val
