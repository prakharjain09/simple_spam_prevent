$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_spam_prevent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_spam_prevent"
  s.version     = 1.0
  s.authors     = ["Prakhar"]
  s.email       = ["prakharjain09@gmail.com"]
  s.homepage    = "https://github.com/prakharjain09/simple_spam_prevent"
  s.summary     = "Block repetetive requests from logged_in users and shows captcha."
  s.description = "Block repetetive requests from logged_in users and shows captcha."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0"

  # s.add_dependency "simple_captcha"
  # s.add_development_dependency "debugger"
  # s.add_dependency "jquery-rails"
  s.add_development_dependency "sqlite3"
end
