# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qrious/ui/version'

Gem::Specification.new do |spec|
  spec.name          = "qrious-ui"
  spec.version       = Qrious::Ui::VERSION
  spec.authors       = ["Kliment Mamykin"]
  spec.email         = ["kmamyk@yahoo.com"]
  spec.description   = %q{Qrious specific collection of JS and helpers to use on projects}
  spec.summary       = %q{Qrious specific collection of JS and helpers to use on projects}
  spec.homepage      = "https://github.com/kmamykin/qrious-ui"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", "~> 3.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
