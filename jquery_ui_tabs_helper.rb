module JqueryUiTabsHelper

  def render_tabs(options = {}, &block)
  
    # insert defaults
    options[:id] = "tabs" unless options[:id]
    
    # jquery ui options
    ui_options = options.delete(:options) || {}
  
    tab_builder = TabBuilder.new
    
    # NB: must be a call to capture, so it behaves like content_for
    capture(tab_builder, &block)     
  
    i, j = 1, 1
  
    html = "<div id=\"#{options[:id]}\" style=\""
    html << "width: #{options[:width]};" if options[:width]
    html << "height: #{options[:height]};" if options[:height]
    html << "margin-bottom: 10px;\""
    html << " class=\"#{options[:class]}\"" if options[:class]
    html << ">"
    html << "<ul>"
    
    tab_builder.tabs.each do |title, block|
      html << "<li><a href=\"##{options[:id]}-tab-#{i}\""
      html << " class=\"#{tab_builder.options[title][:class]}\"" if tab_builder.options[title][:class]
      html << ">#{title}</a></li>"
      i += 1
    end
    
    html << "</ul>"

    tab_builder.tabs.each do |title, block|
      html << "<div id=\"#{options[:id]}-tab-#{j}\">"
      html << "<!-- #{title} -->"
      
      # NB: must be a call to capture, so it behaves like content_for
      content = capture(&block)
      html << content if content.present?

      html << "</div>"
      j += 1
    end

    html << "</div>"
   
    html << "<script type=\"text/javascript\">"
    html << "$(function() { $(\"##{options[:id]}\").tabs({"
    
    # write out tabs options
    #  see http://jqueryui.com/demos/tabs/#options for available list
    first = true
    ui_options.each do |key, value|
      html << "," unless first
      html << " #{key}: #{value}"
      first = false
    end
    
    html << "    });"
    html << "  });"
    html << "</script>"

    raw(html)
    
  end
  
  class TabBuilder

    attr_reader :tabs
    attr_reader :options

    def initialize()
      @tabs = {}
      @options = {}
    end
  
    def add_tab(title, options = {}, &block)
      @tabs[title] = block
      @options[title] = options
    end
  
  end
end
