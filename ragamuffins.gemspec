$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ragamuffins/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ragamuffins"
  s.version     = Ragamuffins::VERSION
  s.authors     = ["Isaac Norman"]
  s.email       = ["idn@papercloud.com.au"]
  s.homepage    = "http://www.github.com/RustComet/Ragamuffins"
  s.summary     = "Find your orphans"
  s.description = "A simple gem for finding out which objects have been orphaned on your iOS or Android App."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.test_files = Dir["spec/**/*"]
end
