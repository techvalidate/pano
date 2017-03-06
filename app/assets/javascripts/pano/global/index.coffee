#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

if Turbolinks && Turbolinks.supported #only bind to unload event if Turbolinks is supported
  $(window).unload((e) -> # if Turbolinks invalidates a view and reloads, reset scroll position like a normal visit
    this.scrollTo(0,0)
  )
