module Pano
  module DropdownHelper

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
      s "<div id='#{options[:custom_id] ? options[:custom_id] : menu.dom_id}' #{tag_options options}>#{menu.render class: 'jq-dropdown-menu'}</div>"
    end

  end
end
