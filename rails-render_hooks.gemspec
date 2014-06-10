# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/render_hooks/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-render_hooks"
  spec.version       = Rails::RenderHooks::VERSION
  spec.authors       = ["pinzolo"]
  spec.email         = ["pinzolo@gmail.com"]
  spec.summary       = %q{Add callbacks for render method}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/pinzolo/rails-render_hooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", ">= 3.2.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
