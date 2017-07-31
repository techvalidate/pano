# =====================================================
# UI
#
# This is a singleton class to make it simpler to write
# callbacks related to DOM events such as:
#
#   * Page Load
#   * Ajax Events
#   * UI input (click, focus, blur, etc.)
#
# =====================================================

class @UI

  # =====================================================
  # Page Load
  #
  # Use this method to wire up behavior on page load.
  #
  # If Turbolinks is supported, we wire your callback up
  # to the turbolinks:load event. If Turbolinks isn't
  # supported, we wire your callback up to $(document).ready().

  @load: (callback) ->
    if Turbolinks? && Turbolinks.supported
      $(document).on 'turbolinks:load', ->
        callback()
    else
      $ ->
        callback()

# =====================================================
# Ajax Events
#
# The following ujs event handlers deal with a set of events
# specific to rails ujs remote forms
# see: https://github.com/rails/jquery-ujs/wiki/ajax

  @ujsSend: (selector, callback) ->
    $(document).ajaxSend ( event, request, options ) ->
      callback(event, request, options)

  @ujsSuccess: (callback) ->
    $(document).ajaxSuccess (event, xhr, options) ->
      callback(event, xhr, options)

  @ujsComplete: (callback) ->
    $(document).ajaxComplete (event, xhr, options) ->
      callback(event, xhr, options)

  @ujsStart: (callback) ->
    $(document).ajaxStart () ->
      callback()

  @ujsStop: (callback) ->
    $(document).ajaxStop () ->
      callback()

  @ujsError: (callback) ->
    $(document).ajaxError (event, jqxhr, options, thrownError) ->
      callback(event, jqxhr, options, thrownError)

# =====================================================
# General-purpose wrapper for binding delegated events
# on the document object. by binding events to document,
# we avoid having to call this after DOM ready, as well
# as after ajax/turbolinks events complete, etc.
#
# Passes a reference to the event and the event target
# to your callback.

  @on: (eventName, selector, callback) ->
    $(document).on eventName, selector, (e) ->
      el = $(e.currentTarget)
      callback(e, el)

# =====================================================
# Convenience methods for commonly-used input UI.
#
# All pass a reference to the event and the event target
# to your callback.

  @input: (selector, callback) ->
    @on 'input', selector, callback

  @change: (selector, callback) ->
    @on 'change', selector, callback

  @blur: (selector, callback) ->
    @on 'blur', selector, callback

# Most click handlers want to prevent event bubbling,
# so this click event handler does that unless your
# callback returns true.

  @click: (selector, callback) ->
    $(document).on 'click touch', selector, (e) ->
      el = $(e.currentTarget)
      unless callback(e, el) == true
        e.preventDefault()

  @submit: (selector, callback) ->
    $(document).on 'submit', selector, (e) ->
      el = $(e.currentTarget)
      unless callback(e, el) == true
        e.preventDefault()
