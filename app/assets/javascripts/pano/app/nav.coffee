
# ===================================================
# show/hide the mobile dropdown menu
# ===================================================

# TODO: BAD CODE -- MAKE MORE DRY, OR USE JQ-DROPDOWN

mobileNavBgClickHandler = (event) ->
  # have to use vanilla js to use the .contains method
  dropdown = document.getElementById('mobile-nav')
  trigger = document.getElementById('mobile-nav-trigger')
  unless dropdown.contains(event.target) || trigger.contains(event.target)
    hideMobileNav()

showMobileNav = ->
  $('#mobile-nav-trigger').addClass 'open'
  $('#mobile-nav').addClass 'visible'
  document.addEventListener 'click', mobileNavBgClickHandler

hideMobileNav = ->
  $('#mobile-nav-trigger').removeClass 'open'
  $('#mobile-nav').removeClass 'visible'
  document.removeEventListener 'click', mobileNavBgClickHandler

# open/close the menu when the menu trigger is clicked
UI.click '#mobile-nav-trigger', (e, el) ->
  if $('#mobile-nav').hasClass 'visible'
    hideMobileNav()
  else
    showMobileNav()

# ===================================================
# show/hide the dropdown menu for the current user
# ===================================================

# TODO: BAD CODE -- MAKE MORE DRY, OR USE JQ-DROPDOWN

userDropdownBgClickHandler = (event) ->
  # have to use vanilla js to use the .contains method
  dropdown = document.getElementById('cur-user-dropdown')
  trigger = document.getElementById('cur-user-dropdown-trigger')
  unless dropdown.contains(event.target) || trigger.contains(event.target)
    hideCurUserDropdown()

showCurUserDropdown = ->
  $('#cur-user-dropdown-trigger').addClass 'open'
  $('#cur-user-dropdown').addClass 'visible'
  document.addEventListener 'click', userDropdownBgClickHandler

hideCurUserDropdown = ->
  $('#cur-user-dropdown-trigger').removeClass 'open'
  $('#cur-user-dropdown').removeClass 'visible'
  document.removeEventListener 'click', userDropdownBgClickHandler

# open/close the menu when the menu trigger is clicked
UI.click '#cur-user-dropdown-trigger', (e, el) ->
  if $('#cur-user-dropdown').hasClass 'visible'
    hideCurUserDropdown()
  else
    showCurUserDropdown()

# ===================================================
# sticky version of subnavs
# ===================================================

UI.load ->
  $("#subnav.sticky-subnav").stick_in_parent(offset_top: $('#nav').height())
