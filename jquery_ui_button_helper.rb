module JqueryUiButtonHelper

  def render_button_radios(options = {}, &block)
  
    # insert defaults
    options[:id] = "radio" unless options[:id]

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
      html << "<input type=\"radio\" id=\"#{button_id}\" name=\"#{options[:id]}\""
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
    html << "$(function() { $(\"##{options[:id]}\").buttonset(); });"
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
