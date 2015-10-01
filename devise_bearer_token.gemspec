$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_bearer_token/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_bearer_token"
  s.version     = DeviseBearerToken::VERSION
  s.authors     = ["Ivgeni Slabkovski"]
  s.email       = ["zhenya@zhenya.ca"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DeviseBearerToken."
  s.description = "TODO: Description of DeviseBearerToken."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "devise"
  s.add_development_dependency "sqlite3"
end
