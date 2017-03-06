module Pano
  class MenuItem
    include ERB::Util, ActionView::Helpers::UrlHelper, ActionView::Helpers::NumberHelper
    include ContentHelper, IconHelper, LinkHelper, NumberHelper

    attr_accessor :menu, :name, :output_buffer, :url, :selected, :count, :options

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
    end

    def length
      @name.length
    end

    # render() generates a link for the menu item in a dropdown menu.
    # The generated link will have the appropriate icon, name, selected state,
    # and html attributes. We ask the parent menu whether we should be a
    # remote link, unless that's been overridden for this menu item.
    def render
      link_text =  s "<span class='item-icon'>#{render_icon}</span>"
      link_text += s " <span class='item-text'>#{h @name}</span>"
      link_text += s " <span class='item-count'>#{delimit @count}</span>" if count
      s "<li>#{s_link_to link_text, @url, @options.selected_if(selected?)}</li>"
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
