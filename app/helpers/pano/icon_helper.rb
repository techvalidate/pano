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
      futuro_icon = futuro_icon_for(icon_name)

      if futuro_icon
        size = options.delete :size || '32'
        image_tag futuro_icon, options.merge({size: size})
      else
        klass = options[:class] ? (options.delete :class) : ''
        klass += ' material-icons'
        content_tag :i, material_icon_for(icon_name), options.add_class(klass)
      end
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

    cx_path = 'pano/icons/cx/'
    engage_path = 'pano/icons/engage/'

    FuturoIcons = {
      'benchmarks':               cx_path + 'benchmarks.svg',
      'custom_attributes':        cx_path + 'custom-attributes.svg',
      'custom_filters':           cx_path + 'custom-filters.svg',
      'demo':                     cx_path + 'demo.svg',
      'enhanced':                 cx_path + 'enhanced.svg',
      'essential':                cx_path + 'essential.svg',
      'import_file':              cx_path + 'import.svg',
      'integrations':             cx_path + 'integrations.svg',
      'knowledge_base':           cx_path + 'knowledge-base.svg',
      'lists':                    cx_path + 'lists.svg',
      'organization':             cx_path + 'organization.svg',
      'password':                 cx_path + 'password.svg',
      'radar':                    cx_path + 'radar.svg',
      'settings':                 cx_path + 'settings.svg',
      'starter':                  cx_path + 'starter.svg',
      'suppressions':             cx_path + 'suppressions.svg',
      'large_survey':             cx_path + 'survey.svg',
      'tags':                     cx_path + 'tags.svg',
      'team':                     cx_path + 'team.svg',
      'you':                      cx_path + 'you.svg',
      'care_about_people':        engage_path + 'care-about-people.svg',
      'focus_group':              engage_path + 'focus-group.svg',
      'future_possibility':       engage_path + 'future-possibility.svg',
      'goals_achieve':            engage_path + 'goals-achieve.svg',
      'long_term_vision':         engage_path + 'long-term-vision.svg',
      'loudspeaker_promotion':    engage_path + 'loudspeaker-promotion.svg',
      'manager':                  engage_path + 'manager.svg',
      'market_forecast':          engage_path + 'market-forecast.svg',
      'math_formula':             engage_path + 'math-formula.svg',
      'mission_accomplished':     engage_path + 'mission-accomplished.svg',
      'monitoring_project_data':  engage_path + 'monitoring-project-data.svg',
      'organization_chart':       engage_path + 'organization-chart.svg',
      'personal_desk':            engage_path + 'personal-desk.svg',
      'personal_development':     engage_path + 'personal-development.svg',
      'schedule_planning':        engage_path + 'schedule-planning.svg',
      'startup_launch':           engage_path + 'startup-launch.svg',
      'statistical_analysis':     engage_path + 'statistical-analysis.svg',
      'success_mission':          engage_path + 'success-mission.svg',
      'survey_list':              engage_path + 'survey-list.svg',
      'take_a_break':             engage_path + 'take_a_break.svg',
      'team_leader':              engage_path + 'team-leader.svg',
      'winners_podium':           engage_path + 'winners-podium.svg'
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
