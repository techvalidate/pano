Pano::Engine.routes.draw do

  guide_routes = [
    :utilities,
    :colors,
    :components,
    :browsers,
    :breakpoints,
    :images,
    :borders,
    :shadows,
    :transforms,
    :grid,
    :nav,
    :typography,
    :icons,
    :lists,
    :links,
    :buttons,
    :tabs,
    :cards,
    :tables,
    :tooltips,
    :forms,
    :hr,
    :arrows,
    :banners,
    :modals,
    :flash_messages,
    :spinners,
    :css,
    :js,
    :helpers,
    :datepicker
  ]

  guide_routes.each do |r|
    get "guide/#{r}", as: "guide_#{r}", to: "guide##{r}"
  end

  get 'wds', as: 'wds', to: 'wds#index'
  
  root to: 'wds#index'

end
