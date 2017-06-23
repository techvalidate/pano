updateFilters = ->
  if('#filter-bar').exists()
    $("#filter-bar").stick_in_parent(parent: '#main', offset_top: 88)
    $(document.body).trigger("sticky_kit:recalc")

UI.load ->
  updateFilters()

UI.click '#show-filters-btn', (e, el) ->
  $('#filters').toggleClass('show')
  updateFilters()

UI.ujsSuccess ->
  updateFilters()
