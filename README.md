# Backbone-Forms Bootstrap TypeAhead editor

[![Build Status](https://travis-ci.org/tomi77/backbone-forms-bootstrap-typeahead.svg?branch=master)](https://travis-ci.org/tomi77/backbone-forms-bootstrap-typeahead)
[![Code Climate](https://codeclimate.com/github/tomi77/backbone-forms-bootstrap-typeahead/badges/gpa.svg)](https://codeclimate.com/github/tomi77/backbone-forms-bootstrap-typeahead)
[![dependencies Status](https://david-dm.org/tomi77/backbone-forms-bootstrap-typeahead/status.svg)](https://david-dm.org/tomi77/backbone-forms-bootstrap-typeahead)
[![devDependencies Status](https://david-dm.org/tomi77/backbone-forms-bootstrap-typeahead/dev-status.svg)](https://david-dm.org/tomi77/backbone-forms-bootstrap-typeahead#type=dev)
[![peedDependencies Status](https://david-dm.org/tomi77/backbone-forms-bootstrap-typeahead/peer-status.svg)](https://david-dm.org/tomi77/backbone-forms-bootstrap-typeahead#type=peer)

## Installation

~~~bash
bower install backbone-forms-bootstrap-typeahead
~~~

or

~~~bash
npm install backbone-forms backbone-forms-bootstrap-typeahead
~~~

## Usage

~~~js
var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
    'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
    'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
    'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
    'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
    'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
    'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
    'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
    'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
];

var Model = Backbone.Model.extend({
    schema: {
        name: {
            type: 'bootstrap.typeahead',
            title: 'Name',
            options: states
        }
    }
});
var model = new Model();
var form = new Backbone.Form({
    model: model
});
$('#form').html(form.render().$el);
~~~

## Demo

http://tomi77.github.io/backbone-forms-bootstrap-typeahead/
