
class ComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  class_option :locale, type: :boolean, default: false
  class_option :stimulus, type: :boolean, default: false

  def create_view_file
    template "#{template_prefix}view.html.haml.erb", component_path + "_#{name_with_namespace.underscore}.html.haml"
  end

  def create_css_file
    template "sass.erb", component_path + "#{name_with_namespace}.sass"
  end

  def create_js_file
    template "js.erb", component_path + "#{name_with_namespace}.js"
    if stimulus?
      template "stimulus_controller_js.erb", component_path + "#{name_with_namespace}_controller.js"
    end
  end

  def create_rb_file
    template "rb.erb", component_path + "#{module_name.underscore}.rb"
  end

  desc "Import to Packs"
  def import_to_packs
    root_path = default_path
    base_path = root_path + "app/frontend/components"

    imports = []

    split_name[0..-2].each do |split|
      base_path += split
      file_path = base_path + "index.js"
      create_file(file_path) unless File.exist?(file_path)
      imports << base_path.relative_path_from(root_path)
    end

    root_path_dup = root_path.dup

    [Pathname.new("components"), *split_name[0..-2]].each do |split|
      root_path_dup += split
      import = imports.shift
      if import
        append_to_file(root_path_dup + "index.js") do
          "\nimport \"#{import}\"\n"
        end
        sort_lines_alphabetically!(root_path_dup + "index.js")
      end
    end

    append_to_file(base_path + "index.js") do
      "\nimport \"#{base_path.relative_path_from(root_path)}/#{component_name}/#{name_with_namespace.underscore}\"\n"
    end
    sort_lines_alphabetically!(base_path + "index.js")
  end

  def clear_component
    return unless destroying?

    base_path = default_path + "app/frontend/components"
    base_path_dup = base_path.dup

    paths = split_name[0..-2].map do |split|
      base_path_dup += split
      [base_path_dup, split]
    end

    paths.reverse.each do |(path, split)|
      FileUtils.rm_rf(component_path)

      Dir.chdir(path)
      directories = Dir.glob("*").select do |entry|
        File.directory?(entry)
      end

      if directories.size == 0
        FileUtils.rm_rf(path)
        remove_line!(base_path + "index.js", split)
      else
        remove_line!(path + "index.js", component_name)
      end
    end

    FileUtils.rm_rf(component_path)
    remove_line!(base_path + "index.js", component_name)
  end

  protected

  def template_prefix
    stimulus? ? "stimulus_" : ""
  end

  def split_name
    @name.split(/[:,::,\/]/).reject(&:blank?).map(&:underscore)
  end

  def name_with_namespace
    split_name.join("_")
  end

  def component_path
    path_parts = [default_path, "app", "frontend", "components", *split_name]

    Pathname.new(path_parts.join("/"))
  end

  def module_name
    "#{name_with_namespace}_component".camelize
  end

  def component_class_name
    name_with_namespace.dasherize
  end

  def component_name
    split_name.last.underscore
  end

  def default_path
    Rails.application.nil? ? Pano::Engine.root : Rails.application.config.root
  end

  def stimulus?
    options[:stimulus]
  end

  private


  def sort_lines_alphabetically!(path)
    lines = File.readlines(path).map do |line|
      line if line =~ /^import ["'](.*)["'];$/
    end.compact

    return if lines.empty?

    lines = lines.uniq.sort

    File.open(path, "w") do |f|
      lines.each do |line|
        f.write(line)
      end
    end
  end

  def remove_line!(path, component_name)
    lines = File.readlines(path).map do |line|
      line unless line =~ /#{component_name}/
    end.compact

    File.open(path, "w") do |f|
      lines.each do |line|
        f.write(line)
      end
    end
  end

  def destroying?
    self.behavior == :revoke
  end
end