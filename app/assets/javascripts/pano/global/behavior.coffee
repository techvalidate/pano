$.behavior = (target, refineSelector) ->
  if refineSelector
    $('[data-behavior~=' + target + ']' + ':' + refineSelector)
  else
    $('[data-behavior~=' + target + ']')

$.fn.disable = ->
  this.each ->
    $(this).prop('disabled', true)

$.fn.enable = ->
  this.each ->
    $(this).prop('disabled', false)

$.fn.exists = ->
  this.length > 0

$.fn.isBlank = ->
  this.val() == ''

$.registerBehavior = (dataBehavior, event, callback) ->
  callback()
  $.behavior(dataBehavior).on event, ->
    callback()

$.fn.uncheck = ->
  this.each ->
    $(this).prop('checked', false).removeClass('checked') # the checked class is for ie8
