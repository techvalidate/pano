Pano::Engine.routes.draw do

  get  'guide/grid',       as: 'guide_grid',       to: 'guide#grid'
  get  'guide/typography', as: 'guide_typography', to: 'guide#typography'
  get  'guide/tabs',       as: 'guide_tabs',       to: 'guide#tabs'
  get  'guide/buttons',    as: 'guide_buttons',    to: 'guide#buttons'
  get  'guide/icons',      as: 'guide_icons',      to: 'guide#icons'
  get  'guide/forms',      as: 'guide_forms',      to: 'guide#forms'
  get  'guide/colors',     as: 'guide_colors',     to: 'guide#colors'
  get  'guide/css',        as: 'guide_css',        to: 'guide#css'
  get  'guide/js',         as: 'guide_js',         to: 'guide#js'
  get  'guide/helpers',    as: 'guide_helpers',    to: 'guide#helpers'

  root to: 'guide#index'

end
