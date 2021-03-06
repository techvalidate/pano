# click on flash messages to dismiss them
UI.click '.flash', (e, msg) ->
  hideFlashMessage msg

# after a while, flash notice messages fade out automatically
UI.load ->
  msg = $('.flash-notice')
  if msg.exists()
    setTimeout (->
      hideFlashMessage msg
    ), 5000

hideFlashMessage = (msg) ->
  msg.addClass('hiding')
  setTimeout (->
    msg.remove()
  ), 200

# delete all flash messages from the DOM prior to turbolinks caching the page.
if Turbolinks? && Turbolinks.supported
  document.addEventListener 'turbolinks:before-cache', ->
    $('.flash').remove()
