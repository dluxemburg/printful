# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'printful/version'

Gem::Specification.new do |spec|
  spec.name          = "printful"
  spec.version       = Printful::VERSION
  spec.authors       = ["Daniel Luxemburg"]
  spec.email         = ["daniel.luxemburg@gmail.com"]
  spec.description   = %q{Ruby client for Printful}
  spec.summary       = %q{Ruby client for Printful}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"

end
