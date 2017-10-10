# =====================================================
# Click handlers that show and hide modals.
#
# usage: add ,js-modal
#        on click .js-modal, href = dom ID of modal to show.
# =====================================================

UI.click('.modal-bg', (e, el) ->
  $target = $(e.target)
  modal = $target.closest('.modal')
  Modals.close(modal)
)

UI.click '.js-modal', (e, el) ->
  e.preventDefault()
  href = el.attr('href')

  if href.indexOf('#') == 0
    data = $(el).data()

    Modals.show $(href), data
  else
    Modals.showAjax(href, null, [$.bindFormValidation])


UI.click '.js-close-modal', (e, el) ->
  $target = $(e.target)
  modal = $target.closest('.modal')
  Modals.close(modal)


# =====================================================
#  Modal Methods
# =====================================================

window.Modals =

  show: (modal, data, callbacks) ->

    if modal
      $('body').css('overflow', 'hidden')
      # // need to center during the fadeIn animation
      modal.fadeIn duration: 200,
      progress: ->
        centerModal(modal)
      done: ->
        addModalResizeListener(modal)

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

      $('body').css('overflow', 'auto')
      $(window).off('resize', centerModal )

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

        $('body').css('overflow', 'hidden')
        centerModal(modal)
        addModalResizeListener(modal)

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
#//  poisitions modal vertical and hortizontal center, since CSS positioning causes blurry text in some cases on OS X Chrome and Safari
centerModal = (el) ->
  modal = $(el).find('.modal-wrapper')
  top = ($(window).height() - modal.height()) / 2
  left = ($(window).width() - modal.width()) / 2

  modal.css('top', top).css('left', left)

addModalResizeListener = (el) ->
  $(window).resize ->
    centerModal(el)

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
