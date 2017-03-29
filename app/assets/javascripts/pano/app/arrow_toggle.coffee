# click-to-toggle links with arrows

UI.click '.js-arrow-toggle', (e, el) ->
  target = $(el.data 'target')
  if target.exists()
    el.toggleClass 'selected'
    target.slideToggle()
