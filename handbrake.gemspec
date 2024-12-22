# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'handbrake/version'

Gem::Specification.new do |spec|
  spec.name          = "handbrake-ruby"
  spec.version       = Handbrake::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]

  spec.summary       = %q{Ruby wrapper for HandBrake CLI}
  spec.description   = %q{A Ruby library that provides an easy-to-use interface for the HandBrake CLI video transcoder}
  spec.homepage      = "https://github.com/yourusername/handbrake-ruby"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
