module Pano
  module IconHelper

    #--------------------
    # load in <head> to use icons
    #--------------------

    def material_icons
      stylesheet_link_tag '//fonts.googleapis.com/icon?family=Material+Icons'
    end

    #--------------------
    # render an icon
    #--------------------

    def icon(icon_name, options = {})
      klass = options[:class] ? (options.delete :class) : ''
      klass += ' material-icons'
      s "<i #{tag_options options.add_class(klass)}>#{material_icon_for icon_name}</i>"
    end

    def med_icon(icon_name, options = {})
      icon icon_name, options.add_class('med-icon')
    end

    def large_icon(icon_name, options = {})
      icon icon_name, options.add_class('large-icon')
    end

    def xl_icon(icon_name, options = {})
      icon icon_name, options.add_class('xl-icon')
    end

    # material icons are often named badly, hence this translation layer
    def material_icon_for(i)
      return MaterialIcons[i.to_sym] if MaterialIcons.key? i.to_sym
      i.to_s
    end

    MaterialIcons = {
      angle_up: 'keyboard_arrow_up',
      angle_down: 'keyboard_arrow_down',
      back: 'arrow_back',
      calendar: 'today',
      check: 'done',
      check_box: 'check_box_outline_blank',
      check_box_checked: 'check_box',
      company: 'location_city',
      delete: 'delete',
      email_outline: 'mail_outline',
      enterprise: 'domain',
      filters: 'tune',
      funnel: 'filter_list',
      help: 'help_outline',
      import: 'system_update_alt',
      key: 'vpn_key',
      list: 'insert_drive_file',
      location: 'location_on',
      logout: 'power_settings_new',
      next: 'keyboard_arrow_right',
      prev: 'keyboard_arrow_left',
      preview: 'pageview',
      profile: 'account_circle',
      response: 'comment',
      responses: 'forum',
      survey: 'assignment',
      time: 'access_time',
      view: 'remove_red_eye'
    }

    #--------------------
    # an icon in a link
    #--------------------

    def icon_to(icon_name, name, options = {}, html_options = {})
      html_options.add_class 'text-icon-link'
      link_to options, html_options do
        icon(icon_name) + span_tag(name)
      end
    end

    #--------------------
    # an empty space the size of an icon
    #--------------------

    def spacer_icon
      s "<i class='icon-spacer'></i>"
    end

  end


end
