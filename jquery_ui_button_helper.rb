module JqueryUiButtonHelper

  def render_button_radios(options = {}, &block)
    render_button_set('radio', options, &block)
  end

  def render_button_checkboxes(options = {}, &block)
    render_button_set('checkbox', options, &block)
  end
  
  private
  
  def render_button_set(type, options = {}, &block)
  
    # insert defaults
    options[:id] = type unless options[:id]

    # jquery ui options
    ui_options = options.delete(:options) || {}

    button_builder = ButtonBuilder.new
    
    # NB: must be a call to capture, so it behaves like content_for
    capture(button_builder, &block)     
  
    html = "<div id=\"#{options[:id]}\" style=\""
    html << "width: #{options[:width]};" if options[:width]
    html << "height: #{options[:height]};" if options[:height]
    html << "\""
    html << " class=\"#{options[:class]}\"" if options[:class]
    html << ">"
    
    button_builder.buttons.each do |title, button_options|
      button_id = "#{options[:id]}_#{title.underscore}"
      html << "<input type=\"#{type}\" id=\"#{button_id}\" name=\"#{options[:id]}\""
      html << " checked=\"checked\"" if button_options[:checked] == true
      
      if options[:remote] == true
        html << " onclick=\"javascript: $('#a_#{button_id}').click();\""  
      end
      html << "/>"

      html << "<label for=\"#{button_id}\">#{title}</label>"

      if options[:remote] == true
        html << "<a href=\"#{button_options[:url]}\" id=\"a_#{button_id}\" data-remote=\"true\" style=\"display: none;\"></a>"
      end

    end
    html << "</div>"
    
    html << "<script type=\"text/javascript\">"
    html << "$(function() { $(\"##{options[:id]}\").buttonset({"

    # write out buttonset options
    #  see http://jqueryui.com/demos/button/#options for available list
    first = true
    ui_options.each do |key, value|
      html << "," unless first
      html << " #{key}: #{value}"
      first = false
    end
    
    html << "}); });"
    html << "</script>"

    raw(html)
    
  end

  class ButtonBuilder

    attr_reader :buttons

    def initialize()
      @buttons = {}
    end
  
    def add_button(title, options = {})
      @buttons[title] = options
    end
  
  end
  
end
