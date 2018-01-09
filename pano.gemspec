$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'pano/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'pano'
  s.version     = Pano::VERSION
  s.authors     = ['Jordan McKible', 'Jon Wolfe']
  s.email       = ['jordan@techvalidate.com', 'jon@techvalidate.com']
  s.homepage    = 'https://github.com/techvalidate/pano'
  s.summary     = 'Shared CSS, Javascript, and helpers for SurveyMonkey Solutions'

  s.files = Dir["{app,config,db,lib}/**/*", 'Rakefile', 'README.md']

  s.add_dependency 'bourbon', '4.3.4'
  s.add_dependency 'coffee-rails', '4.2.1'
  s.add_dependency 'haml', '5.0.1'
  s.add_dependency 'jquery-rails', '4.3.1'
  s.add_dependency 'rails', '5.1.4'
  s.add_dependency 'sass-rails', '5.0.6'
  s.add_dependency 'turbolinks', '5.1.0'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
