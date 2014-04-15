$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ragamuffins/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ragamuffins"
  s.version     = Ragamuffins::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Ragamuffins."
  s.description = "TODO: Description of Ragamuffins."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
