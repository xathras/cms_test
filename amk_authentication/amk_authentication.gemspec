$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "amk_authentication/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "amk_authentication"
  s.version     = AmkAuthentication::VERSION
  s.authors     = ["Andrew Kothmann"]
  s.email       = ["andrew.kothmann@gmail.com"]
  s.homepage    = "https://github.com/xathras/cms_test"
  s.summary     = "Authentication for rails apps"
  s.description = "Authentication for rails apps"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency 'bcrypt'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
end
