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
      'https://www.surveymonkey.com/mp/policy/surveymonkey-trial-account-terms-service/'
    end

    def mark_if_current(options)
      current_page?(options) ? 'selected' : ''
    end

    def js_void
      'Javascript:void(0)'
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

  end
end
