module Pano
  class Menu
    include ActionView::Helpers::TagHelper, ERB::Util, Pano::ContentHelper, Pano::IconHelper

    attr_accessor :filtered, :items, :name, :output_buffer, :single_select, :remote, :searchable

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
      output = "<ul #{tag_options html_options}>"
      output += render_search_field if searchable?
      if empty?
        output += render_empty_message
      else
        items.each do |item|
          output += item.render
        end
      end

      output += "</ul>"
      s output
    end

    def render_empty_message
      qualifier = filtered ? 'matching' : ''
      output = '<li class="empty-menu-message">'
      output += icon(:filter_list)
      output += "<h3>Can't filter by #{ActionController::Base.helpers.sanitize name.singularize}</h3><p>No #{qualifier} survey responses have #{ActionController::Base.helpers.sanitize name.singularize.down_articleize}.</p>"
      output += '</li>'
      s output
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
      return 0 if empty?
      [items.map(&:length).max, 5].min
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
