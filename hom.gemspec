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
  s.files = Dir.glob('lib/**/*.rb') + %w(LICENSE.txt README.md CHANGES.md hom.gemspec)
  s.required_ruby_version = '>= 1.9.3'
  s.require_path = 'lib'
  s.metadata = {
    'homepage' => 'https://github.com/timcraft/hom',
    'source_code_uri' => 'https://github.com/timcraft/hom',
    'bug_tracker_uri' => 'https://github.com/timcraft/hom/issues',
    'changelog_uri' => 'https://github.com/timcraft/hom/blob/main/CHANGES.md'
  }
end
