module Pano
  module BrowserHelper
    # helpers specific to browsers and browser versions
    # such as browser detection

    def noscript_banner
      s "<noscript>
           <div class='top-message-bar'>
             Your browser has Javascript disabled. This website will work better if you enable Javascript.
           </div>
         </noscript>"
    end

    def unsupported_ie_banner(min_version = 10)
      s "<!--[if lt IE #{min_version}]>
          <div class='top-message-bar'>
            Sorry, your web browser is unsupported.
          </div>
        <![endif]-->"
    end

  end
end
