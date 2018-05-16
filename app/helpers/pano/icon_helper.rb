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
      content_tag :i, material_icon_for(icon_name), options.add_class(klass)
    end

    def svg_icon(icon_name, options = {})
      futuro_icon = futuro_icon_for(icon_name)
      size = options.delete :size || '32'

      image_tag futuro_icon, options.merge({size: size})
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

    def futuro_icon_for(i)
      return FuturoIcons[i.to_sym] if FuturoIcons.key? i.to_sym
      false
    end

    icon_path = 'pano/icons/'

    FuturoIcons = {
      'back':                     icon_path + 'arrow.svg',
      'benchmarks':               icon_path + 'benchmarks.svg',
      'custom_attributes':        icon_path + 'custom-attributes.svg',
      'custom_filters':           icon_path + 'custom-filters.svg',
      'demo':                     icon_path + 'demo.svg',
      'enhanced':                 icon_path + 'enhanced.svg',
      'essential':                icon_path + 'essential.svg',
      'import_file':              icon_path + 'import.svg',
      'integrations':             icon_path + 'integrations.svg',
      'knowledge_base':           icon_path + 'knowledge-base.svg',
      'lists':                    icon_path + 'lists.svg',
      'organization':             icon_path + 'organization.svg',
      'password':                 icon_path + 'password.svg',
      'radar':                    icon_path + 'radar.svg',
      'settings':                 icon_path + 'settings.svg',
      'starter':                  icon_path + 'starter.svg',
      'suppressions':             icon_path + 'suppressions.svg',
      'large_survey':             icon_path + 'survey.svg',
      'tags':                     icon_path + 'tags.svg',
      'team':                     icon_path + 'team.svg',
      'you':                      icon_path + 'you.svg',
      'care_about_people':        icon_path + 'care-about-people.svg',
      'focus_group':              icon_path + 'focus-group.svg',
      'future_possibility':       icon_path + 'future-possibility.svg',
      'goals_achieve':            icon_path + 'goals-achieve.svg',
      'long_term_vision':         icon_path + 'long-term-vision.svg',
      'loudspeaker_promotion':    icon_path + 'loudspeaker-promotion.svg',
      'manager':                  icon_path + 'manager.svg',
      'market_forecast':          icon_path + 'market-forecast.svg',
      'math_formula':             icon_path + 'math-formula.svg',
      'mission_accomplished':     icon_path + 'mission-accomplished.svg',
      'monitoring_project_data':  icon_path + 'monitoring-project-data.svg',
      'organization_chart':       icon_path + 'organization-chart.svg',
      'personal_desk':            icon_path + 'personal-desk.svg',
      'personal_development':     icon_path + 'personal-development.svg',
      'schedule_planning':        icon_path + 'schedule-planning.svg',
      'startup_launch':           icon_path + 'startup-launch.svg',
      'statistical_analysis':     icon_path + 'statistical-analysis.svg',
      'success_mission':          icon_path + 'success-mission.svg',
      'survey_list':              icon_path + 'survey-list.svg',
      'take_a_break':             icon_path + 'take_a_break.svg',
      'team_leader':              icon_path + 'team-leader.svg',
      'winners_podium':           icon_path + 'winners-podium.svg'
    }

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
