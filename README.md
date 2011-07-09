# Rails 3 View Helpers for [jQuery UI](http://jqueryui.com) Widgets

This project contains helper classes for creating jQuery UI widgets in your Rails views.

The following helpers have been implemented:

* [Accordian](http://jqueryui.com/demos/accordion)
* [AutoComplete](http://jqueryui.com/demos/autocomplete)
* [Button](http://jqueryui.com/demos/button)
* [Datepicker](http://jqueryui.com/demos/datepicker)
* [Tabs](http://jqueryui.com/demos/tabs)

## Getting Started

Install [jQueryUI](http://jqueryui.com) components, and copy the required helper files into <rails_root>/app/helpers

## Using Helpers

### Accordian

    <%= render_accordion() do |b| %>
      <% b.add_pane("Pane 1")) %>
        <!-- ... HTML content for pane goes here... -->
      <% end %>
      <% b.add_pane("Pane 2") %>
        <!-- ... HTML content for pane goes here... -->
      <% end %>
    <% end %>

### Auto Complete

The auto complete field requires a `:source` URL resource and a `block` for resolving the selected item. 
This source URL resource must return matched items in JSON format. The request parameter "term" gets added to that URL.

    <%= form_for(@model) do |f| %>
      <div class="field">
        <%= f.label_for :product_id %> <br />
        <%= f.auto_complete(
              :product_id, 
              :source => product_search_path(:format => :json),
              :min_length => 1,
              :placeholder => 'Enter product code'
              ) {|product_id| Product.find(product_id) unless product_id.nil? }  %>
      </div>
    <% end %>

Example JSON returned from source URL resource.

    [
      { "id": "1", "label": "Product 1", "value": "Product 1"},
      { "id": "2", "label": "Product 2", "value": "Product 2"},
      ...
      { "id": "N", "label": "Product N", "value": "Product N"},
    ]

The `id` will be stored in a hidden form field, the `label` displayed in the drop down and the `value` is displayed 
in the input field after a selection is made.

### Button

#### Default Button

_TODO_

#### Radios

    <%= render_button_radios() do |b| %>
      <% b.add_button("Button 1"), :checked => true) %>
      <% b.add_button("Button 2") %>
      <% b.add_button("Button 3") %>
    <% end %>

#### Checkboxes

_TODO_

#### Toolbar

_TODO_

#### Split Button

_TODO_

### Datepicker

    <%= form_for(@model) do |f| %>
      <div class="field">
        <%= f.label_for :date_field_name %> <br />
        <%= f.date_picker :date_field_name %>
      </div>
    <% end %>
       
### Tabs

    <%= render_tabs() do |b| %>
      <% b.add_tab('Tab 1') do %>
        <!-- ... HTML content for tab goes here... -->
      <% end %>
      <% b.add_tab('Tab 2') do %>
        <!-- ... HTML content for tab goes here... -->
      <% end %>
      <% b.add_tab('Tab 3') do %>
        <!-- ... HTML content for tab goes here... -->
      <% end %>
    <% end %>

## Work in Progress

Detailed documentation of each helper needs to be added to the wiki.

Additional helpers for the other jQuery UI widgets will be added, including:

* [Dialog](http://jqueryui.com/demos/datepicker)
* [Progressbar](http://jqueryui.com/demos/progressbar)
* [Slider](http://jqueryui.com/demos/slider)

Once implementations for each widget are completed, the project will be transformed into a Gem for easy inclusion into Rails applications.

# Copyright
Copyright (c) 2011 Chris Stefano. 
See [LICENSE](https://github.com/virtualstaticvoid/jquery_ui_helpers/blob/master/MIT-LICENSE) for details.

