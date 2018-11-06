module Pano
  module DropdownHelper

    def kebab_dropdown(id, **options)
      builder = DropdownBuilder.new(self)
      toggle = link_to med_icon(:more_vert), js_void, class: 'dropdown-toggle slate', data: {action: 'dropdown#toggle'}
      contents = dropdown_menu_filter id, options do
        capture(builder, &Proc.new)
      end
      content_tag :div, safe_join([toggle, contents]), class: 'dropdown', data: {'dropdown': id, controller: 'dropdown'}
    end

    def dropdown_menu_filter(id, options = {}, &block)
      options[:data] = {id: id, target: 'dropdown.menu'}
      content_tag :ul, options.add_class('dropdown-menu') do
        capture(&block)
      end
    end

    # helpers to build dropdown menus based on our Menu class
    # and powered by the jqeury.dropdown plugin.
    def dropdown(menu, link_options = {}, menu_options = {})
      dropdown_link(menu, link_options) + dropdown_menu(menu, menu_options)
    end

    def dropdown_link(menu, options = {})
      if options[:data]
        options[:data]['jq-dropdown'] = "##{options[:custom_id] ? options[:custom_id] : menu.dom_id}"
      else
        options[:data] = {'jq-dropdown': "##{options[:custom_id] ? options[:custom_id] : menu.dom_id}"}
      end
      menu_name = options.delete(:name) || menu.name
      link_to menu_name, '#', options.add_class('jq-dropdown-link')
    end

    def dropdown_menu(menu, options = {})
      anchor = options.delete :anchor
      klass = if anchor.nil? then "jq-dropdown jq-dropdown-relative" else "jq-dropdown jq-dropdown-relative jq-dropdown-anchor-#{anchor}" end

      options.add_class klass
      options[:id] = options[:custom_id] ? options[:custom_id] : menu.dom_id

      # s "<div id='#{options[:custom_id] ? options[:custom_id] : menu.dom_id}' #{tag_options options}>#{menu.render class: 'jq-dropdown-menu'}</div>"

      content_tag :div, options do
        menu.render class: 'jq-dropdown-menu'
      end
    end
  end

  class DropdownBuilder
    def initialize(template)
      @template = template
    end

    def item(name, url, selected = false, options = {})
      @template.content_tag :li do
        action = options[:action] || ''
        options[:data] = options[:data] || {}
        options[:data][:action] = action + ' dropdown#onSelect'

        icon = @template.span_tag (selected ? @template.icon(:done, class: 'sabeus') : @template.spacer_icon), class: 'item-icon'
        @template.link_to (icon + name), url, options.add_class(selected ? 'selected' : '')
      end
    end

    def action_item(icon, name, url, options = {})
      @template.content_tag :li do
        action = options[:action] || ''
        options[:data] = {action: action}
        icon = @template.span_tag @template.icon(icon), class: 'item-icon'
        @template.link_to (icon + name), url, options
      end
    end
  end
end
