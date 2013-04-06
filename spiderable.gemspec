# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spiderable/version'

Gem::Specification.new do |gem|
  gem.name          = "spiderable"
  gem.version       = Spiderable::VERSION
  gem.authors       = ["Spiderable"]
  gem.email         = ["hello@spiderable.org"]
  gem.description   = %q{Allows your rails application to be spiderable by crawlers}
  gem.summary       = %q{Allows your rails application to be spiderable by crawlers}
  gem.homepage      = "http://www.spiderable.org"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'faraday'
end
