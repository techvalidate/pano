module Pano
  module FlashHelper

    def flash_messages
      content = ''
      flash.keys.each do |key|
        :ruby
          case key
          when 'notice'
            flash_title = 'Success'
            flash_icon = :done
          when 'alert' || 'warning' || 'error'
            flash_title = 'Error'
            flash_icon = :warning
          when 'info'
            flash_icon = :info
          else
            flash_icon = nil
          end

        # behavior = 'hide-flash'
        # behavior += ' transient-flash' if [:notice, :transient].include? key.to_sym
        content +=
          "<div class='flash flash-#{h key}' data-controller='flash'>
            #{icon(:close, class: 'close-icon', data: {action: 'click->flash#close'})}
            <ul class='plain flex-row align-items-top'>
              <li class='mr-m'>#{icon flash_icon, class: 'flash-icon'}</li>
              <li class='justify-center-column'>
                <p class='featured'>#{flash_title}</p>
                <p class='mt-s'>#{h flash[key].html_safe}</p>
              </li>
          </div>"

      end
      s content
    end

  end
end
