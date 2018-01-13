$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'properties2ruby'
  s.version      = '0.0.1'
  s.summary      = 'Read and write Java properties files'
  s.author       = 'Bartek Wilczek'
  s.email        = 'bwilczek@gmail.com'
  s.files        = Dir['lib/**/*.rb']
  s.require_path = 'lib'
  s.homepage     = 'https://github.com/bwilczek/properties2ruby'
  s.license      = 'MIT'
  s.required_ruby_version = '~> 2.2'
  s.add_dependency 'activesupport', '~> 4.0'
  s.add_dependency 'java-properties', '~> 0.2'
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'rubocop', '~> 0.52'
end
