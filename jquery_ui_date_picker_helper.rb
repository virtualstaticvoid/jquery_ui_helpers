module JqueryUiDatePickerHelper
  include ActionView::Helpers::FormTagHelper
  
  def date_picker(method, options={})
  
    sanitized_object_name ||= @object_name.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
    sanitized_method_name ||= method.to_s.sub(/\?$/,"")

    value = @object.send(method)
    has_error = @object.errors[method].present?

    html = ""
    html << "<div class=\"field_with_errors\">" if has_error
    html << text_field_tag("#{@object_name.to_s}[#{method.to_s}]", value, options)
    html << "<script type=\"text/javascript\">"
    html << "  $(function() {"
    html << "    $('##{sanitized_object_name}_#{sanitized_method_name}').datepicker({"
    
    # write out datepicker options
    #  see http://jqueryui.com/demos/datepicker/#options for available list
    if options[:options].is_a?(Hash)
      first = true
      options[:options].each do |key, value|
        html << "," unless first
        html << " #{key}: #{value}"
        first = false
      end
    end
    
    html << "    });"
    html << "  });"
    html << "</script>"
    html << "</div>" if has_error
    
    html.html_safe
  
  end
end

ActionView::Helpers::FormBuilder.send(:include, JqueryUiDatePickerHelper)

