# =====================================================
# Click handlers that show and hide modals.
#
# usage: add ,js-modal
#        on click .js-modal, href = dom ID of modal to show.
# =====================================================

UI.click('.modal-bg', (e, el) ->
  $target = $(e.target)
  modal = $target.closest('.modal-container')
  Modals.close(modal)
)

UI.click '.js-modal', (e, el) ->
  e.preventDefault()
  href = el.attr('href')
  $('body').css('overflow', 'hidden')

  #// snapPixels allows us to fix the fuzzy text caused by 3d transformations on Safari and Chrome
  #// this can be removed when and if these browser bugs are fixed
  snapPixels = (el) ->
    modal = $(el).find('.modal-wrapper')
    top = modal.position().top
    newY = Math.round(top)
    left = modal.position().left
    newX = Math.round(left)

    if left != newX && top != newY
      leftCorrection = left - parseInt(left)
      topCorrection = top - parseInt(top)
      modal.css('transform', 'translate3d(calc(-50% - ' + leftCorrection + 'px), calc(-50% - ' + topCorrection + 'px), 0)')
    else if left != newX
      leftCorrection = left - parseInt(left)
      modal.css('transform', 'translate3d(calc(-50% - ' + leftCorrection + 'px), 50%, 0)')
    else if top != newY
      topCorrection = top - parseInt(top)
      modal.css('transform', 'translate3d(-50%, calc(-50% - ' + topCorrection + 'px), 0)')

  if href.indexOf('#') == 0
    data = $(el).data()

    Modals.show $(href), data, [snapPixels]
  else
    Modals.showAjax(href, null, [$.bindFormValidation, snapPixels])


UI.click '.js-close-modal', (e, el) ->
  $target = $(e.target)
  modal = $target.closest('.modal-container')
  $('body').css('overflow', 'auto')
  Modals.close(modal)


# =====================================================
#  Modal Methods
# =====================================================

window.Modals =

  show: (modal, data, callbacks) ->
    if modal
      setModalTop(modal)
      modal.fadeIn 200
      Modals.currentModals.push modal

      if callbacks
        for callback in callbacks
          do ->
            callback(modal)

  close: (modal) ->
    if modal
      modal.fadeOut 200
      Modals.currentModals.pop modal

      if modal.hasClass('js-ajax-modal')
        modal.remove()

  currentModals: []

  showAjax: (url, data, callbacks) ->

    $.get(url, (data, textStatus, jqXHR) ->
# this is the success callback. it gets called after normal responses AND redirects.
      if jqXHR.getResponseHeader('REQUIRES_AUTH') == '1'

        window.location = "https://" + window.location.hostname + "/login" # send the person to the login page
      else
        htmlResponse = $(data)
        htmlResponse.addClass 'js-ajax-modal'
        id = htmlResponse.attr('id')
        $('body').append(htmlResponse)

        if id
          Modals.show($("##{id}"))

        if callbacks && callbacks.length
          callbacks.forEach((callback) -> if _.isFunction(callback) then callback(htmlResponse))

    ).fail((jqXHR, textStatus, errorThrown) ->

      if jqXHR.status == 404
        alert('Sorry, the requested item could not be found.')

      if jqXHR.status == 500
        alert('Sorry, an error occurred in processing your request. Please contact support if the error persists.')
    )


  ajaxloadingMessage: ->
    """
      <div class='modal loading'>
        <h2>Loading...</h2>
      </div>
    """

# =====================================================
#  Modal Helpers
# =====================================================

setModalTop = (modal) ->
  #modal.css('top', "#{$(window).scrollTop() + ($(window).height() / 10)}px")



##Override the default confirm dialog by rails
#$.rails.allowAction = (link) ->
#  if link.data("confirm") == undefined
#    return true
#
#  $.rails.showConfirmationDialog(link)
#  return false
#
##User click confirm button
#$.rails.confirmed = (link) ->
#  link.data("confirm", null)
#  link.trigger("click.rails")
#
##Display the confirmation dialog
#$.rails.showConfirmationDialog = (link) ->
#  message = link.data("confirm")
#  url = link.attr('href')
#  method = link.data('method')
#
#  vex.dialog.confirm({
#    message: message
#    callback: (value) ->
#      if value && url && method
#        $.ajax({
#          url: url
#          method: method
#          success: (response) ->
#            eval(response)
#        })
#  })
