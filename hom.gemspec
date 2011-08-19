Gem::Specification.new do |s|
  s.name = 'hom'
  s.version = '0.1.0'
  s.platform = Gem::Platform::RUBY
  s.authors = ['Tim Craft']
  s.email = ['mail@timcraft.com']
  s.homepage = 'http://github.com/timcraft/hom'
  s.description = 'A straightforward API for generating HTML programmatically'
  s.summary = 'See description'
  s.files = Dir.glob('{lib,test}/**/*') + %w(README.txt hom.gemspec)
  s.add_development_dependency('activesupport', ['>= 3.0.3'])
  s.require_path = 'lib'
end
