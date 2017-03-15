module Pano
  class Menu
    include ActionView::Helpers::TagHelper, Pano::ContentHelper, Pano::IconHelper

    attr_accessor :items, :name, :output_buffer, :single_select, :remote, :searchable

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
      self.single_select = options.delete :single_select
      self.remote        = options.delete :remote
      self.searchable    = options.delete :searchable
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
      return if empty?
      content_tag :ul, html_options do
        (searchable? ? render_search_field : '') + items.collect(&:render).join("\n")
      end
    end

    def remote?
      @remote
    end

    def render_search_field
      s "<div class='menu-search'>#{icon :search}<input type='text' size='#{search_field_length}' placeholder='Search' class='menu-search-field'></input></div>"
    end

    def searchable?
      @searchable
    end

    def search_field_length
      l = items.map(&:length).max
      l = 5 if l < 5
      l
    end

    def selected
      select &:selected
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
