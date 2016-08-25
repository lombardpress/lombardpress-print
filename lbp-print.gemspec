# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lbp/print/version'

Gem::Specification.new do |spec|
  spec.name          = "lbp-print"
  spec.version       = Lbpprint::Print::VERSION
  spec.authors       = ["Jeffrey C. Witt"]
  spec.email         = ["jeffreycwitt@gmail.com"]

  spec.summary       = %q{A command line print gem form tei transcriptions followin the lbp schema}
  spec.description   = %q{A command line print gem form tei transcriptions followin the lbp schema}
  spec.homepage      = "http://github.com/lombardpress/lbp-print"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["lbp-print"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  spec.add_runtime_dependency 'lbp', "~> 0.1.1"
end
