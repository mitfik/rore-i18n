$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rore/i18n/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rore-i18n"
  s.version     = RoreI18n::VERSION
  s.authors     = ["Robert Mitwicki"]
  s.email       = ["robert.mitwicki@opensoftware.pl"]
  s.homepage    = "https://github.com/mitfik/rore-i18n"
  s.summary     = "i18n extension for ror-ecommerce"
  s.description = "Plugin provide globalization features for store"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency 'routing-filter'
  s.add_dependency "globalize3"

  s.add_development_dependency "sqlite3"
end
