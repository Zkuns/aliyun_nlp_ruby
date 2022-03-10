# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aliyun_nlp_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "aliyun_nlp_ruby"
  spec.version       = AliyunNlpRuby::VERSION
  spec.authors       = ["Zkun"]
  spec.email         = ["zhukun6150909@gmail.com"]

  spec.summary       = %q{Aliyun NLP ruby sdk}
  spec.description   = %q{Aliyun NLP ruby sdk}
  spec.homepage      = "https://github.com/Zkuns/aliyun_NLP_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "uuid", ">=2.0"
  spec.add_dependency "faraday", "~> 1.8"

  spec.add_development_dependency "bundler", "> 1.14"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", ">= 3.0"
end
