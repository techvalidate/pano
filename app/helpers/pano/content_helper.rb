module Pano
  module ContentHelper

    def arrow_toggle(toggle_target, toggle_text)
      s "<a class='js-arrow-toggle' href='#' data-target='#{toggle_target}'>#{h toggle_text}</a>"
    end

    def copyright
      s "&copy; #{current_year} SurveyMonkey"
    end

    def current_year
      Time.zone.now.strftime '%Y'
    end

    # These methods are for more easily making a tag from within a helper method.
    # Instead of content_tag(:div), do div_tag(), etc. Add more tags here as needed.
    %i(div h2 h3 h4 h5 h6 p span).each do |tag|
      define_method "#{tag}_tag" do |content_or_options_with_block = nil, options = nil, escape = true, &block|
        content_tag tag, content_or_options_with_block, options, escape, &block
      end
    end

    def empty_message(title, subtitle = nil)
      div_tag class: 'empty-message' do
        str = large_icon :info_outline
        str += h2_tag title
        str += p_tag subtitle if subtitle
        str
      end
    end

    def humanize_period(period, options = {})
      month_format = options[:brief] ? '%b.' : '%B'
      if period.first == period.last
        # one day
        period.first.strftime("#{month_format} %e, %Y")
      elsif period.first.day == 1 && period.last == Date.civil(period.first.year, period.first.month, -1)
        # one month
        period.first.strftime("#{month_format} %Y")
      elsif period.first.year == period.last.year && period.first.month == period.last.month
        # two days in one month
        period.first.strftime("#{month_format} %e") + ' - ' + period.last.strftime('%e, %Y')
      elsif period.first.year == period.last.year
        # two days in the same year
        period.first.strftime("#{month_format} %e") + ' - ' + period.last.strftime("#{month_format} %e, %Y")
      else
        # two days in different years
        period.first.strftime("#{month_format} %e, %Y") + ' - ' +  period.last.strftime("#{month_format} %e, %Y")
      end
    end

    def name(title, value)
      content_tag :p do
        str = case value
              when Integer then delimit(value)
              when Range   then humanize_period(value)
              when true    then 'Yes'
              when false   then 'No'
              else              value.to_s
              end
        content_tag(:strong, "#{title}: ") + str
      end
    end

    # Shorthand for html_safe
    def s(string)
      string.try :html_safe
    end

    # Set the page title
    def title(t)
      @title = html_escape t
    end

  end
end
