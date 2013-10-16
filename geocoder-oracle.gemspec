# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geocoder/oracle/version'

Gem::Specification.new do |spec|
  spec.name          = "geocoder-oracle"
  spec.version       = Geocoder::Oracle::VERSION
  spec.authors       = ["Curtis Schiewek"]
  spec.email         = ["curtis.schiewek@gmail.com"]
  spec.description   = %q{Adds Oracle support to the geocoder gem}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "geocoder", "~> 1.1"
end