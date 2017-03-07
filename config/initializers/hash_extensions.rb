class Hash

  # sets :class to css_class, unless the
  # hash already has that key. If it does, css_class
  # is appended to :class
  def add_class(css_class)
    store :class, "#{delete(:class).to_s} #{css_class}"
    self
  end

  def selected_if(condition)
    add_class('selected') if condition
    self
  end

end
