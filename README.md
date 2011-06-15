# Rails 3 View Helpers for [jQuery UI](http://jqueryui.com) Widgets

This project contains helper classes for creating jQuery UI widgets in your Rails views.

The following helpers have been implemented:

* [Accordian](http://jqueryui.com/demos/accordion)
* [Button](http://jqueryui.com/demos/button)
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
      <% b.add_pane("Pane 3") %>
        <!-- ... HTML content for pane goes here... -->
      <% end %>
    <% end %>

### ButtonSet

    <%= render_buttonset() do |b| %>
      <% b.add_button("Button 1"), :checked => true) %>
      <% b.add_button("Button 2") %>
      <% b.add_button("Button 3") %>
      <% b.add_button("Button 4") %>
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

* [Autocomplete](http://jqueryui.com/demos/autocomplete)
* [Datepicker](http://jqueryui.com/demos/datepicker)
* [Dialog](http://jqueryui.com/demos/datepicker)
* [Progressbar](http://jqueryui.com/demos/progressbar)
* [Slider](http://jqueryui.com/demos/slider)

Once implementations for each widget are completed, the project will be transformed into a Gem for easy inclusion into Rails applications.

# Copyright
Copyright (c) 2011 Chris Stefano. See [LICENSE](https://github.com/virtualstaticvoid/jquery_ui_helpers/blob/master/MIT-LICENSE) for details.
