$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pano/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pano"
  s.version     = Pano::VERSION
  s.authors     = ["Jordan McKible"]
  s.email       = ["jordan@mckible.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Pano."
  s.description = "TODO: Description of Pano."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
