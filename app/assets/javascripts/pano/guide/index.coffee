#= require pano/global
#= require_tree .

# styleguide examples with inline tabs

UI.click '.styleguide-example .tabs a', (e, el) ->
  target = el.attr 'href'
  container = el.parent().parent()
  container.find('.panel').addClass 'hidden'
  container.find(target).removeClass 'hidden'
  container.find('.tabs a').removeClass 'selected'
  el.addClass 'selected'
