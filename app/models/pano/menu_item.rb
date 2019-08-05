module Pano
  class MenuItem
    include ERB::Util, ActionView::Helpers::UrlHelper, ActionView::Helpers::NumberHelper
    include Pano::ContentHelper, Pano::IconHelper, Pano::LinkHelper, Pano::NumberHelper

    attr_accessor :count, :menu, :name, :options, :output_buffer, :selected, :url, :make_first

    # During initialization, these option keys are exctracted to init attr_accessors:
    #
    #  :selected, :count
    #
    # Any other passed options will be used to generate html attributes in render() --
    # think of them the same as you would html_options passed to link_to().
    def initialize(menu, name, url, options = {})
      self.menu             = menu
      self.name             = name
      self.url              = url
      self.selected         = options.delete :selected
      self.count            = options.delete :count
      self.options          = options
      self.options[:remote] = options.key?(:remote) ? options[:remote] : menu.remote?
      self.make_first       = options.delete :make_first
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

      link_text  = content_tag(:span, render_icon, class: 'item-icon')
      link_text += content_tag(:span, options[:descriptor_icon], class: 'descriptor-icon') if options[:descriptor_icon]
      link_text += content_tag(:span, @name, class: 'item-text')
      link_text += content_tag(:span, delimit(@count), class: 'item-count') if count
      link_text = 'first!' if make_first

      content_tag :li do
        link_to link_text, @url, @options.selected_if(selected?)
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

    def with_count?
      count.nil? || count > 0
    end

    def with_zero_count?
      count && count == 0
    end

    # used in sorting menu items. here are the sorting criteria:
    #
    # - all selected items come first.
    # - all non-selected items with a count > 0 come next
    # - all items with nil or 0 count come last
    #
    # - within each bucket, items are secondarily sorted by name
    #
    def <=>(other)
      return special_sort(other) if selected? && other.selected?               # both items are selected, so compare by name
      return -1                  if selected?                                  # this item is selected, the other is not, so put this item first
      return 1                   if other.selected?                            # the other item is selected so put it first
      return special_sort(other) if with_zero_count? && other.with_zero_count? # neither item has any valid matches, so compare by name
      return 1                   if with_zero_count?                           # this item has no matches, but other does, so put other first
      return -1                  if other.with_zero_count?                     # this item has matches but the other one doesn't so put this one first
      special_sort(other)                                                      # finally, fall back to sorting by name
    end

    # a hack for when you have one special menu item you need put first, like the current user in an assignee menu
    def special_sort(other)
      return -1 if make_first
      return 1 if other.make_first
      @name <=> other.name
    end

  end
end
