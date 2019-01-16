require 'bourbon'
require 'haml'
require 'jquery-rails'
require 'turbolinks'

require 'pano/version' # So the version number is available in the mounted style guide

module Pano
  class Engine < ::Rails::Engine
    engine_name 'pano'
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
      Pano.config.component.component_paths.append(Pano::Engine.root.join("app/frontend/components"))
    end

    initializer 'pano.action_dispatch' do |app|
      ActiveSupport.on_load :action_controller do
        ActionController::Base.prepend_view_path Pano::Engine.root.join("app/frontend")
      end
    end

    initializer 'pano.autoload', before: :set_autoload_paths do |app|
      app.config.autoload_paths << Pano::Engine.root.join('app/frontend')
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
