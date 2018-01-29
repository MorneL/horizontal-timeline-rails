# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'horizontal-timeline-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "horizontal-timeline-rails"
  spec.version       = Horizontal::Timeline::Rails::VERSION
  spec.authors       = ["morneL"]
  spec.email         = ["morne.lotze@getsmarter.com"]

  spec.summary       = %q{Horizontal Timeline for Rails >= 3.1}
  spec.description   = %q{A wrapper for Horizontal Timeline in the Rails asset pipeline}
  spec.homepage      = "https://github.com/MorneL/horizontal-timeline-rails"
  spec.license       = "MIT"

  spec.files         = Dir["{lib,vendor}/**/*"] + ["LICENSE.txt", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
