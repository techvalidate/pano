$.isCSSFeatureSupported = (cssFeature) ->
  supported = false
  domPrefixes = 'Webkit Moz ms O'.split(' ')
  elm = document.createElement('div')
  cssFeatureUpperCase = null

  cssFeature = cssFeature.toLowerCase()

  if elm.style[cssFeature] != undefined
    supported = true

  if supported == false
    cssFeatureUpperCase = cssFeature.charAt(0).toUpperCase() + cssFeature.substr(1)

    for i in [0...domPrefixes.length]
      if elm.style[domPrefixes[i] + cssFeatureUpperCase ] != undefined
        supported = true
        break

  return supported