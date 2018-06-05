module Pano
  module NavHelper

    # Renders a responsive top nav bar for one of our App views.
    # main_links are the links on the left, right_links go next to
    # the current user display on the right, and user_links go
    # in a dropdown under the current user display.
    #
    # main_links should be an array of hashes, with each hash having a these keys:
    #   name: required, also downcased and matched against @nav to determine which nav link is selected
    #   url:  required, the link that the nav link goes to
    #
    # user_links should be an array of hashes, with each hash having a these keys:
    #   icon:  required
    #   name:  required
    #   url:   required
    #   class: optional extra css class on the link (used for separators via .separated)
    #
    def app_top_nav(options = {})
      partial 'pano/components/app_top_nav',
              main_links:  options[:main_links],
              user_links:  options[:user_links]
    end

    # Renders a link with a .selected class if the current @nav variable matches
    # options[:key] or (if :key isn't passed) the link text. Also adds a .nav-link
    # class to the links for styling hooks, and can add an icon to the nav link via
    # the optional options[:icon]
    def nav_link(name, url, options = {})
      key = options.delete(:key) || name.parameterize.underscore.to_sym
      options = options.selected_if(@nav == key).add_class 'nav-link'
      if icon = options.delete(:icon)
        icon_to icon, name, url, options
      else
        link_to name, url, options
      end
    end

  end
end
