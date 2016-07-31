# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "robotoy/version"

Gem::Specification.new do |spec|
  spec.name          = "robotoy"
  spec.version       = Robotoy::VERSION
  spec.authors       = ["hosseintoussi"]
  spec.email         = ["hossein@mindvalley.com"]

  spec.summary       = %q{Toy Robot Ruby}
  spec.description   = %q{This gem is a simulation of a toy robot moving on a square tabletop.}
  spec.homepage      = "https://github.com/hosseintoussi/rubotoy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["robotoy"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
