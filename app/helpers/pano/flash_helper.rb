module Pano
  module FlashHelper

    def flash_messages
      content = ''
      flash.keys.each do |key|
        # behavior = 'hide-flash'
        # behavior += ' transient-flash' if [:notice, :transient].include? key.to_sym

        content +=
          "<div class='flash flash-#{h key}'>
            #{icon(:close, class: 'close-icon')}
            #{h flash[key]}
          </div>"

      end
      s content
    end

  end
end
