
/*
  Backbone-Forms Bootstrap TypeAhead editor 1.0.1

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-typeahead

  Released under the MIT license
 */
(function(root, factory) {
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['underscore', 'backbone', 'backbone-forms', 'bootstrap-typeahead'], factory);
      break;
    case typeof exports !== 'object':
      require('bootstrap-typeahead');
      factory(require('underscore'), require('backbone'), require('backbone-forms'));
      break;
    default:
      factory(root._, root.Backbone, root.Backbone.Form);
  }
})(this, function(_, Backbone, Form) {

  /*
  Additional editors that depend on Twitter TypeAhead
   */
  Form.editors['bootstrap.typeahead'] = Form.editors.Text.extend({
    className: 'bbf-bootstrap-typeahead',
    initialize: function(options) {
      var ref;
      Form.editors.Base.prototype.initialize.call(this, options);
      _.bindAll(this, 'renderOptions');
      this.$el.attr({
        type: 'text',
        'data-provide': 'typeahead',
        autocomplete: 'off'
      });
      if (((ref = this.schema) != null ? ref.options : void 0) == null) {
        throw new Error("Missing required 'schema.options'");
      }
    },

    /*
    Adds the editor to the DOM
     */
    render: function() {
      this.setValue(this.value);
      this.setOptions(this.schema.options);
      return this;
    },

    /*
    Sets the options that populate the data-source attribute

    @param {Mixed} options
     */
    setOptions: function(options) {
      switch (false) {
        case !(options instanceof Backbone.Collection):
          if (options.length > 0) {
            this.renderOptions(options);
          } else {
            options.fetch({
              success: this.renderOptions
            });
          }
          break;
        case !_.isFunction(options):
          options(this.renderOptions, this);
          break;
        default:
          this.renderOptions(options);
      }
    },

    /*
    Adds the data-source attribute to the input element
    @param {Mixed}   Options as a simple array e.g. ['option1', 'option2']
                     or as a Backbone collection
     */
    renderOptions: function(options) {
      var source;
      source = (function() {
        switch (false) {
          case !_.isArray(options):
            return options;
          case !(options instanceof Backbone.Collection):
            return options.map(function(row) {
              return row.toString();
            });
        }
      })();
      this.$el.data({
        items: source.length,
        source: source
      });
      this.setValue(this.value);
    }
  });
});
