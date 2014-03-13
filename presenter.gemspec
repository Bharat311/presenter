# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'presenter/version'

Gem::Specification.new do |spec|
  spec.name          = "presenter"
  spec.version       = Presenter::VERSION
  spec.authors       = ["Bharat Gupta"]
  spec.email         = ["bindassbharat311@gmail.com"]
  spec.description   = %q{A very simple Presenter implementation}
  spec.summary       = %q{A very simple Presenter implementation}
  spec.homepage      = "http://github.com/Bharat311/presenter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
