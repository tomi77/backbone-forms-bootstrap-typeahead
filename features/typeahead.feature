Feature: Test "bootstrap.typeahead" editor

  Scenario: Show form with editor
    Given Show form
    Then I should see "bbf-bootstrap-typeahead" editor

  Scenario: "focus" event
    Given Show form
    When Click on the "bbf-bootstrap-typeahead" editor
    Then "focus" event is fired

  Scenario: "blur" event
    Given Show form
    When Click on the "bbf-bootstrap-typeahead" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event
    Given Show form
    When Click on the "bbf-bootstrap-typeahead" editor
    And Select new state
    Then Change event is fired and show "Alaska"
