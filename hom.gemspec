Gem::Specification.new do |s|
  s.name = 'hom'
  s.version = '1.3.0'
  s.license = 'LGPL-3.0'
  s.platform = Gem::Platform::RUBY
  s.authors = ['Tim Craft']
  s.email = ['mail@timcraft.com']
  s.homepage = 'https://github.com/timcraft/hom'
  s.description = 'A straightforward API for generating HTML'
  s.summary = 'See description'
  s.files = Dir.glob('{lib,spec}/**/*') + %w(LICENSE.txt Rakefile README.md CHANGES.md hom.gemspec)
  s.required_ruby_version = '>= 1.9.3'
  s.add_development_dependency('rake', '>= 12')
  s.add_development_dependency('activesupport', '~> 5')
  s.add_development_dependency('minitest', '~> 5')
  s.require_path = 'lib'
end
