module Pano
  class ComponentPathResolver
    def resolve(component_name)
      root_path = component_paths.find do |path|
        path_has_component?(path, component_name)
      end

      if root_path.nil?
        raise ComponentPathResolver::MissingComponentError.new(
          component_name,
          component_paths,
        )
      end

      root_path.join(*component_name)
    end

    protected

    def path_has_component?(path, component_name)
      file_name = path.join(*[
        component_name,
        "#{component_name.split("/").join("_")}_component.rb",
      ])
      File.exist?(file_name)
    end

    def component_paths
      component_configuration.component_paths.map do |path|
        Pathname.new(path)
      end
    end

    def component_configuration
      app_configuration.component
    end

    def app_configuration
      Pano.config
    end

    class MissingComponentError < StandardError
      def initialize(component_name, paths)
        message = "Component `#{component_name}` not found in:\n"
        paths.each do |path|
          message += "  * #{path}\n"
        end
        super(message)
      end
    end
  end
end