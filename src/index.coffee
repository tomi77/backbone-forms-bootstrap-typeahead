###
  Backbone-Forms Bootstrap TypeAhead editor 1.0.1

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-typeahead

  Released under the MIT license
###

((root, factory) ->
  switch
    when typeof define is 'function' and define.amd
      define ['underscore', 'backbone', 'backbone-forms', 'bootstrap-typeahead'], factory
    when typeof exports is 'object'
      require('bootstrap-typeahead')
      factory require('underscore'), require('backbone'), require('backbone-forms')
    else
      factory root._, root.Backbone, root.Backbone.Form
  return
) @, (_, Backbone, Form) ->
  ###
  Additional editors that depend on Twitter TypeAhead
  ###
  Form.editors['bootstrap.typeahead'] = Form.editors.Text.extend
    className: 'bbf-bootstrap-typeahead'

    initialize: (options) ->
      Form.editors.Base::initialize.call @, options

      _.bindAll @, 'renderOptions'

      @$el.attr
        type: 'text'
        'data-provide': 'typeahead'
        autocomplete: 'off'

      unless @schema?.options?
        throw new Error "Missing required 'schema.options'"
      return

    ###
    Adds the editor to the DOM
    ###
    render: () ->
      @setValue @value
      @setOptions @schema.options
      @

    ###
    Sets the options that populate the data-source attribute

    @param {Mixed} options
    ###
    setOptions: (options) ->
      switch
        # If a collection was passed, check if it needs fetching
        when options instanceof Backbone.Collection
          # Don't do the fetch if it's already populated
          if options.length > 0
            @renderOptions options
          else
            options.fetch success: @renderOptions

        # If a function was passed, run it to get the options
        when _.isFunction options
          options @renderOptions, @

        # Otherwise, ready to go straight to renderOptions
        else
          @renderOptions options

      return

    ###
    Adds the data-source attribute to the input element
    @param {Mixed}   Options as a simple array e.g. ['option1', 'option2']
                     or as a Backbone collection
    ###
    renderOptions: (options) ->
      source = switch
        # Accept array
        when _.isArray options
          options

        # Or Backbone collection
        when options instanceof Backbone.Collection
          options.map (row) -> row.toString()

      # Insert options
      @$el.data
        items: source.length
        source: source

      # Select correct option
      @setValue @value
      return

  return
