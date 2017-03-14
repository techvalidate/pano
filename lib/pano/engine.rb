require 'bourbon'
require 'haml'
require 'jquery-rails'
require 'turbolinks'

module Pano
  class Engine < ::Rails::Engine
    isolate_namespace Pano

    initializer 'pano.assets.precompile' do |app|
      app.config.assets.precompile += %w(
        pano/guide.css
        pano/mailers.css
        pano/marketing.css

        pano/guide.js
      )
    end
  end
end
