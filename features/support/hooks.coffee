{defineSupportCode} = require('cucumber')

defineSupportCode ({After}) ->
  After () -> @driver.quit()
