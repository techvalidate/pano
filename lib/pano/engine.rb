require 'bourbon'
require 'haml'
require 'jquery-rails'
require 'turbolinks'

require 'pano/version' # So the version number is available in the mounted style guide

module Pano
  class Engine < ::Rails::Engine
    isolate_namespace Pano

    initializer 'pano.assets.precompile' do |app|
      app.config.assets.precompile += %w(
        pano/guide.css
        pano/mailers.css
        pano/marketing.css

        pano/guide.js
        pano/icons/*.svg
      )
    end

    config.after_initialize do |app|
      app.config.komponent.component_paths.append(Pano::Engine.root.join("frontend/components"))
    end

    initializer 'my_engine.action_dispatch' do |app|
      ActiveSupport.on_load :action_controller do
        ActionController::Base.prepend_view_path Pano::Engine.root.join("frontend")
      end
    end

    initializer 'my_engine.autoload', before: :set_autoload_paths do |app|
      app.config.autoload_paths << Pano::Engine.root.join('frontend')
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
