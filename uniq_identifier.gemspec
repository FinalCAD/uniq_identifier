require_relative 'lib/uniq_identifier/version'

Gem::Specification.new do |spec|
  spec.name          = 'uniq_identifier'
  spec.version       = UniqIdentifier::VERSION
  spec.authors       = ['Joel AZEMAR']
  spec.email         = ['joel.azemar@gmail.com']
  spec.summary       = %q{Add an uniq identifier}
  spec.description   = %q{Add an uniq identifier on your models}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.required_ruby_version = '~> 2.1'

end
