# handle clicks on elements with data-behavior='clickable'.
# these elements need a data-href attribute.

# there is a hack to allow clicks on links inside 'clickable'
# elements to be handled normally.

UI.click '[data-behavior~=clickable]', (e, el) ->
  # el is the 'clickable' element, clicked_element is the thing
  # that actually got clicked, which could be a child
  debugger;
  clicked_element = $(e.target)
  if clicked_element.is('a') || clicked_element.parents('a').length != 0
    e.stopPropagation()
    return true
  href = $(el).data('href')
  window.location.href = href if href
