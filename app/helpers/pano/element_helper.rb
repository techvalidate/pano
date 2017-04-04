module ElementHelper
  def area_chart(options={})
    s "<donut-chart #{convert_options_to_data_attributes options}/>"
  end

  def count_up_number(options={}, html_options)
    content_tag 'count-up-number', convert_options_to_data_attributes(options), html_options
  end

  def donut_chart(options={})
    s "<donut-chart #{convert_options_to_data_attributes options} />"
  end

end