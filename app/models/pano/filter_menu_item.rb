module Pano
  class FilterMenuItem
    include ERB::Util, ActionView::Helpers::UrlHelper, ActionView::Helpers::NumberHelper
    include Pano::ContentHelper, Pano::IconHelper, Pano::LinkHelper, Pano::NumberHelper

    attr_accessor :count, :menu, :name, :options, :output_buffer, :selected, :url

    # During initialization, these option keys are exctracted to init attr_accessors:
    #
    #  :selected, :count
    #
    # Any other passed options will be used to generate html attributes in render() --
    # think of them the same as you would html_options passed to link_to().
    def initialize(menu, name, url, options = {})
      self.menu     = menu
      self.name     = name
      self.url      = url
      self.selected = options.delete :selected
      self.count    = options.delete :count
      self.options  = options
      self.options[:remote] = options.key?(:remote) ? options[:remote] : menu.remote?
      self.options[:data] = {}
      self.options[:data][:target] = 'filters.filter'
      self.options[:data][:action] = 'ajax:success->filters#onSuccess click->filters#toggleSelection'
    end

    def length
      @name.length
    end

    # render() generates a link for the menu item in a dropdown menu.
    # The generated link will have the appropriate icon, name, selected state,
    # and html attributes. We ask the parent menu whether we should be a
    # remote link, unless that's been overridden for this menu item.
    def render
      # link_text  =  "<span class='item-icon'>#{render_icon}</span>"
      # link_text +=  "<span class='descriptor-icon'>#{options[:descriptor_icon]}</span>" if options[:descriptor_icon]
      # link_text +=  "<span class='item-text'>#{h @name}</span>"
      # link_text +=  "<span class='item-count'>#{delimit @count}</span>" if count
      # item = ''
      # item +=  "<li>#{s_link_to link_text, @url, @options.selected_if(selected?)}</li>" if count.nil? || count.positive?
      #
      # s item

      link_text  = content_tag(:input, '', type: 'checkbox', checked: selected?)
      link_text += content_tag(:span, options[:descriptor_icon], class: 'descriptor-icon') if options[:descriptor_icon]
      link_text += content_tag(:label, @name, class: 'item-text')
      link_text += content_tag(:span, delimit(@count), class: 'item-count') if count

      content_tag :li, class: 'form-group' do
        content_tag :div, class: 'checkbox' do
          link_to link_text, @url, @options.selected_if(selected?)
        end
      end

    end

    def render_icon
      return icon(:check)             if @menu.single_select? && selected?
      return spacer_icon              if @menu.single_select?
      return icon(:check_box_checked) if selected?
      return icon(:check_box)
    end

    def selected?
      @selected
    end

    # used in sorting menus
    def <=>(other)
      if selected? == other.selected?
        @name <=> other.name
      else
        selected? ? -1 : 1
      end
    end
  end
end
