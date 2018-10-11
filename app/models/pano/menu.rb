module Pano
  class Menu
    include ActionView::Helpers::TagHelper, ERB::Util, Pano::ContentHelper, Pano::IconHelper

    attr_accessor :filtered, :items, :name, :output_buffer, :single_select, :remote, :searchable, :sorted, :noun

    # During initialization, these option keys are exctracted to init attr_accessors:
    #
    #  :single_select, :remote, :searchable
    #
    # Any other passed options will be used to generate html attributes in render()
    # -- think of them the same as you would html_options passed to content_tag().
    #
    # Menus are multiselect by default. Pass single_select: true to override.
    def initialize(name, options = {})
      self.items         = []
      self.name          = name
      self.filtered      = options.delete :filtered
      self.single_select = options.delete :single_select
      self.remote        = options.delete :remote
      self.searchable    = options.delete :searchable
      self.sorted        = options.delete :sorted
      self.noun          = options.delete(:noun) || 'response'
    end

    delegate :<<,     to: :items
    delegate :empty?, to: :items
    delegate :each,   to: :items

    def dom_id
      "dropdown-menu-#{@name.parameterize}"
    end

    def single_select?
      @single_select
    end

    def render(html_options = {})
      output = []
      output << render_search_field if searchable?
      if empty?
        output << render_empty_message
      elsif sorted
        # sorted menus put selected items first,
        # then all items with a non-zero count,
        # then items with a zero count of matching objects.
        # if there are items with a zero count, a separator is rendered before them.
        sort
        output << selected_items.collect(&:render)
        output << unselected_items_with_count.collect(&:render)
        output << render_zero_count_separator unless unselected_items_with_zero_count.empty?
        output << unselected_items_with_zero_count.collect(&:render)
      else
        output << items.collect(&:render)
      end

      content_tag :ul, safe_join(output), html_options
    end

    def remote?
      @remote
    end

    def render_empty_message
      qualifier = filtered ? 'matching' : ''
      # output = '<li class="empty-menu-message">'
      # output += icon(:filter_list)
      # output += "<h3>Can't filter by #{ActionController::Base.helpers.sanitize name.singularize}</h3><p>No #{qualifier} survey responses have #{ActionController::Base.helpers.sanitize name.singularize.down_articleize}.</p>"
      # output += '</li>'
      # s output

      content_tag :li, class: 'empty-menu-message' do
        icon(:filter_list) +
        content_tag(:h3, "Can't filter by #{ActionController::Base.helpers.sanitize name.singularize}") +
        content_tag(:p, "No #{qualifier} #{noun.pluralize} have #{ActionController::Base.helpers.sanitize name.singularize.down_articleize}.")
      end
    end

    def render_search_field
      # s "<div class='menu-search'>#{icon :search}<input type='text' size='#{search_field_length}' placeholder='Search' class='menu-search-field'></input></div>"
      content_tag :div, class: 'menu-search' do
        icon(:search) +
        content_tag(:input, '', type: 'text', size: search_field_length, placeholder: 'Search', class: 'menu-search-field')
      end
    end

    def render_zero_count_separator
      # <li class='zero-count-separator'>Zero</li>
      content_tag :li, "#{name.pluralize} with 0 matching #{noun.pluralize}", class: 'zero-count-separator'
    end

    def searchable?
      @searchable
    end

    def search_field_length
      return 0 if empty?
      [items.map(&:length).max, 5].min
    end

    def selected
      select &:selected
    end

    def selected_items
      items.select {|i| i.selected?}
    end

    def unselected_items_with_count
      items.select {|i| i.with_count? && !i.selected?}
    end

    def unselected_items_with_zero_count
      items.select {|i| i.with_zero_count? && !i.selected?}
    end

    def selected?
      !selected.empty?
    end

    def sort
      items.sort!
      self
    end
  end
end
