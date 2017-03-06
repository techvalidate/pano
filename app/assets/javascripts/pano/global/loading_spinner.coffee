#= require ./ui

# =====================================================
# Show a loading spinner overlay on successful form
# submission and during AJAX events.
# =====================================================

#----------------------------------------
# Form submit callback

# Spinner won't be shown in Safari on submit, due to the way JavaScript is handled on POST
# TODO: find a better workaround than click handling and event.preventDefault() on submit.
UI.submit 'form', (e, el) ->
  if $(el).valid() && !$(el).data('remote')
    showLoadingSpinner()
    true # let the form submission go through

#----------------------------------------
# Ajax Events

UI.on 'ajax:send', document, (e, el) ->
  showLoadingSpinner()

#----------------------------------------
# Times we need to hide the spinner

$(document).ajaxStop ->
  hideLoadingSpinner()

# this is for a firefox "feature"
$(window).unload ->
  hideLoadingSpinner()

# prevents spinner from showing when back button is used, since Safari would otherwise cache the spinner state
$(window).bind 'pageshow', (evt) ->
  if evt.originalEvent.persisted
    hideLoadingSpinner()

UI.load ->
  # handle browsers that don't use transitions. Ahem, IE8/9
  createFallbackLoadingSpinner()

  # This gets around a Safari issue where the loading
  # spinner sometimes stays there after a page is
  # restored from the turbolinks cache.
  hideLoadingSpinner()

#----------------------------------------
# Utility methods

# stuff to avoid race condition
timeoutPending = false
spinnerHiddenDuringTimeout = false

showLoadingSpinner = ->
  transitionSupport = $.isCSSFeatureSupported('transition')

  # IE hack for frozen spinner during submit.
  if !transitionSupport
    unfreezeIELoadingAnimation()

  timeoutPending = true
  setTimeout (->
    unless spinnerHiddenDuringTimeout
      $('#loading-overlay-container').removeClass('hidden').addClass('visible')
      setTimeout (->
        $('#loading-overlay').addClass('visible')
      ), 1
      timeoutPending = false
      spinnerHiddenDuringTimeout = false
  ), 200 # the delay is so if things are really fast you won't see the spinner at all.

hideLoadingSpinner = ->
  $('#loading-overlay-container').addClass('hidden')
  $('#loading-overlay').removeClass('visible')

  spinnerHiddenDuringTimeout = true if timeoutPending

unfreezeIELoadingAnimation =  ->
  $('#loading-overlay-container .fallback-spinner').innerHTML = ''
  $('#loading-overlay-container .fallback-spinner').css('display', '')
  $('#loading-overlay-container .fallback-spinner').css('background', $('#loading-overlay-container .fallback-spinner').css('background'))

createFallbackLoadingSpinner = ->
  transitionSupport = $.isCSSFeatureSupported('transition')

  if !transitionSupport
    $('.loading-spinner').remove()
    fallbackSpinner = '<div class="fallback-spinner"></div>'
    $('#loading-overlay').append(fallbackSpinner)