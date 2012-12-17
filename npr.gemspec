# -*- encoding: utf-8 -*-
require File.expand_path('../lib/npr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bryan Ricker"]
  gem.email         = ["bricker@scpr.org"]
  gem.description   = %q{NPR (npr.org) is a news organization. This gem helps you pull NPR content with a nice Ruby DSL.}
  gem.summary       = %q{A Ruby client for the NPR API}
  gem.homepage      = "http://github.com/bricker/npr"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "npr"
  gem.require_paths = ["lib"]
  gem.version       = NPR::VERSION
  
  gem.licenses = ['MIT']
  
  gem.add_dependency 'faraday', ['>= 0.8.0']
  gem.add_dependency 'faraday_middleware', ['>= 0.9.0']

  gem.add_development_dependency 'bundler', ['>= 1.0.0']
  gem.add_development_dependency 'rake', ['>= 0']
  gem.add_development_dependency 'rspec', ['>= 0']
  gem.add_development_dependency 'fakeweb', ['>= 0']
end
