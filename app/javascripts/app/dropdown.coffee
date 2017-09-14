# ----------------------------------------
# Extra behavior for jq-dropdowns. main
# behavior is in jquery.dropdown.min.js
# ----------------------------------------

# auto-focus search field in dropdown when dropdown is shown
UI.load ->
  dropdowns = $('.jq-dropdown')
  dropdowns.on 'show', (e, dropdownData) ->

    dropdown = $(e.currentTarget)
    link = $("[data-jq-dropdown='##{dropdown.attr('id')}']")

    searchField = dropdown.find('.menu-search-field')
    searchField.focus() if searchField.exists()

    if dropdown.hasClass('jq-dropdown-anchor-left')
      dropdownWidth = dropdown.children().first().width()
      linkWidth = link.outerWidth()
      left = parseInt(dropdown.css('left'))
      offset = (left - dropdownWidth) + linkWidth

      dropdown.css('left', "#{offset}px")

# search within dropdown items
UI.on 'keyup', '.jq-dropdown .menu-search-field', (e, el) ->
  input = el
  options = input.parent().siblings('li')
  selection = input.val()?.toLowerCase()
  if selection
    options.each ->
      text = $(this).find('.item-text').text().toLowerCase()
      if text.indexOf(selection) > -1
        $(this).show()
      else
        $(this).hide()
  else
    options.show()

# close the dropdown whenever you click a link
UI.click '.jq-dropdown li a', (e, el) ->
  el.closest('.jq-dropdown').hide()
  true
