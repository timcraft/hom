Gem::Specification.new do |s|
  s.name = 'hom'
  s.version = '1.3.0'
  s.platform = Gem::Platform::RUBY
  s.authors = ['Tim Craft']
  s.email = ['mail@timcraft.com']
  s.homepage = 'http://github.com/timcraft/hom'
  s.description = 'A straightforward API for generating HTML'
  s.summary = 'See description'
  s.files = Dir.glob('{lib,spec}/**/*') + %w(Rakefile README.md CHANGES.md hom.gemspec)
  s.add_development_dependency('rake', '~> 10.0.3')
  s.add_development_dependency('activesupport', ['~> 3.0'])
  s.require_path = 'lib'

  if RUBY_VERSION == '1.8.7'
    s.add_development_dependency('minitest', '>= 4.2.0')
  end
end
