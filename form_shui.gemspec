# -*- encoding: utf-8 -*-
require File.expand_path('../lib/form_shui/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["bryanbcabalo", "robertomiranda", "CultureJam Inc."]
  gem.email         = ["bcabalo@gmail.com", "rjmaltamar@gmail.com"]
  gem.description   = %q{A Gem for form_shui API}
  gem.summary       = %q{Gem for form_shui API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "form_shui"
  gem.require_paths = ["lib"]
  gem.version       = FormShui::VERSION

  gem.add_dependency "faraday", "~> 0.8.1"
  gem.add_dependency "faraday_middleware", "~> 0.8.8"
  gem.add_dependency "lh-faraday-auth-hmac", "~> 1.0.1.20130116"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "rspec", "~> 2.11.0"
  gem.add_development_dependency "rake"
  gem.add_development_dependency 'webmock', '~> 1.6'
end
