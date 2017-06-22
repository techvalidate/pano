module Pano
  class AppFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::FormTagHelper, Pano::ContentHelper, Pano::IconHelper

    delegate :content_tag, :capture, to: :@template

    #############################################################################
    #                              E L E M E N T S                              #
    #############################################################################

    # For checkboxes and radio buttons, we don't put them into their own form-groups.
    # You can put multiple checkboxes and radios into a group manually.
    def check_box(name, label_text, options = {}, checked_value = '1', unchecked_value = '0')
      content_tag :div, class: 'checkbox' do
        label name, safe_join([super(name, options, checked_value, unchecked_value), label_text])
      end
    end

    def collection_select(name, label_text, collection, value_method, text_method, options = {})
      group_for name, label_text, options do
        super name, collection, value_method, text_method, options, options
      end
    end

    def date_select(name, label_text, options = {})
      options[:icon] = :calendar unless options[:icon]
      date_or_time_picker :date, name, label_text, options
    end

    def datetime_select(name, label_text, options = {})
      options[:icon] = :calendar unless options[:icon]
      date_or_time_picker :datetime, name, label_text, options
    end

    def email_field(name, label_text, options = {})
      options[:icon] = :email unless options[:icon]
      group_for name, label_text, options do
        super name, options
      end
    end

    def file_field(name, label_text, options = {})
      options[:icon] = :attach_file unless options[:icon]
      group_for name, label_text, options do
        super name, options
      end
    end

    def grouped_collection_select(name, label_text, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
      group_for name, label_text, html_options do
        super name, collection, group_method, group_label_method, option_key_method, option_value_method, options, html_options
      end
    end

    def password_field(name, label_text, options = {})
      options[:icon] = :key unless options[:icon]
      group_for name, label_text, options do
        super name, options
      end
    end

    def plain_check_box(name, options = {})
      ActionView::Helpers::FormBuilder.instance_method(:check_box).bind(self).call(name, options)
    end

    def plain_text_field(name, options = {})
      ActionView::Helpers::FormBuilder.instance_method(:text_field).bind(self).call(name, options)
    end

    def radio_button(name, label_text, tag_value, options = {})
      content_tag :div, class: 'radio' do
        html = safe_join([super(name, tag_value, options), label_text])
        label name, html, value: tag_value
      end
    end

    def select(name, label_text, choices = nil, options = {}, html_options = {}, &block)
      group_for name, label_text, html_options do
        super name, choices, options, html_options, &block
      end
    end

    def text_area(name, label_text, options = {})
      group_for name, label_text, options do
        super name, options
      end
    end

    def text_field(name, label_text, options = {})
      group_for name, label_text, options do
        super name, options
      end
    end

    def time_select(name, label_text, options = {})
      options[:icon] = :time unless options[:icon]
      date_or_time_picker :time, name, label_text, options
    end

    def time_zone_select(name, label_text, priority_zones = nil, options = {}, html_options = {})
      group_for name, label_text, html_options do
        super name, priority_zones, options, html_options
      end
    end

    #############################################################################
    #                                 L A Y O U T                               #
    #############################################################################

    # standard form footer, with one submit button.
    def footer(btn_label, options_for_btn = {})
      content_tag :div, class: 'form-footer' do
        submit btn_label, options_for_btn
      end
    end

    # Form groups. Useful for groups of radio buttons or checkboxes.
    #
    # Passed options get applied to the form group, the label, and the control itself.
    #
    # If you want a group without a label, pass nil for label_text
    def group(label_text, options = {}, &block)
      name = options.delete :name

      # Required fields are the default. Add class='required' unless options[:optional] is true.
      if options.delete :optional
        options.add_class 'optional'
      else
        options.add_class 'required'
      end

      # Help text will be rendered after the form control.
      help_text = options.delete :help

      # Icon will be rendered after the form control.
      icon_options = options.delete :icon

      # Options for the form group
      group_options         = options.except :id
      group_options.add_class 'form-group'
      group_options.add_class 'has-error' if has_error?(name) # TODO should this be on the group, the element, or both?

      # Options for the label tag
      label_options         = options.except :id
      label_options.add_class 'group-label'
      label_options[:for]   = options[:id] if options[:id]

      # Options for the element itself
      options.add_class 'group-control'

      content_tag :div, group_options do
        html =  generate_label name, label_text, label_options
        html << generate_icon(icon_options)
        html << capture(&block)
        html << generate_help(name, help_text)
        html
      end
    end

    def group_for(name, label_text, options = {}, &block)
      options[:name] = name
      group label_text, options, &block
    end

    def primary_submit(*args)
      options = args.extract_options!
      options[:class] = [options[:class], 'btn-primary'].join(' ')
      submit *(args << options)
    end

    protected

    def generate_label(name, text, options)
      text ? label(name, text, options) : ''
    end

    def generate_icon(name)
      name ? icon(name): ''
    end

    def generate_help(_name, text)
      text ? content_tag(:span, text, class: 'help-block') : ''
    end

    def has_error?(name)
      object.respond_to?(:errors) && !(name.nil? || object.errors[name].empty?)
    end

    # implements date/time pickers based on Rome jquery plugin
    def date_or_time_picker(picker_type, name, label_text, options = {})
      input_options = options.clone
      group_options = options.key?(:data) ? options[:data].except(:rule_dateRangeValidate, :rule_dateIsInFuture) : options

      group_for name, label_text, group_options do
        case picker_type
        when :datetime
          wrapper_options             = {class: 'date-picker-wrapper'}
          input_options[:class]       = !input_options.key?(:optional) ? 'required date-picker' :'date-picker'
          input_options['data-datepicker'] = ''
        when :date
          wrapper_options             = {class: 'date-picker-wrapper'}
          input_options[:class]       = !input_options.key?(:optional) ? 'required date-picker' :'date-picker'
          input_options['data-datepicker'] = 'date-only'
        when :time
          wrapper_options             = {class: 'time-picker-wrapper'}
          input_options[:class]       = !input_options.key?(:optional) ? 'required time-picker' :'time-picker'
          input_options['data-datepicker'] = 'time-only'
        end

        input_options.delete :optional

        div_tag wrapper_options do
          plain_text_field name, input_options
        end
      end
    end

  end

end
