module Pano
  class Configuration
    attr_accessor :component

    def initialize
      @component = ActiveSupport::OrderedOptions.new
      @component.root = Rails.application.config.root
      @component.component_paths = []
    end

    def self.config
      @config ||= Configuration.new
    end

    def self.config=(config)
      @config = config
    end

    def self.configure
      yield config
    end
  end
end