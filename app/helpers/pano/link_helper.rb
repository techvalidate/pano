module Pano
  module LinkHelper

    # shortcuts for hardcoded absolute URLs

    def privacy_url
      "https://#{I18n.locale}.surveymonkey.com/mp/policy/privacy-policy/"
    end

    def terms_of_use_url
      "https://#{I18n.locale}.surveymonkey.com/mp/policy/terms-of-use/"
    end

    def trial_terms_of_use_url
      "https://#{I18n.locale}.surveymonkey.com/mp/policy/surveymonkey-trial-account-terms-service/"
    end

    def mark_if_current(options)
      current_page?(options) ? 'selected' : ''
    end

    def nav_link(name, url, options = {})
      key = options.delete(:key) || name.parameterize.underscore.to_sym
      options = options.selected_if(@nav == key).add_class 'nav-link'
      if icon = options.delete(:icon)
        icon_to icon, name, url, options
      else
        link_to name, url, options
      end
    end

    def popup_link_to(name, link, options = {})
      link_to name, link, options.merge(target: '_blank')
    end

    def popup_nf_link_to(name, link, options = {})
      link_to name, link, options.merge({rel: 'nofollow', target: '_blank'})
    end

    def s_link_to(body, url_options = {}, html_options = {})
      link_to s(body), url_options, html_options
    end

    def selected_if(condition)
      condition ? 'selected' : ''
    end

    def subnav_link(name, url, options = {})
      key = options.delete(:key) || name.parameterize.underscore.to_sym
      link_to name, url, options.add_class('subnav-link').selected_if(@subnav == key)
    end
  end
end
