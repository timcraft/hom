A straightforward API for generating HTML programmatically.

Install via rubygems (no dependencies):

  gem install hom

Either require it, or add it to your Rails Gemfile:

  require 'hom'

  gem 'hom'

Generate HTML using HOM::Element objects. The first constuctor argument is
a symbol representing the tag name, for example:

  HOM::Element.new(:br)

The second constructor argument represents the element attributes, and can be
nil, a single symbol/string, a hash, or an array of hashes and symbols/strings.
For example:

  HOM::Element.new(:input, :disabled)

  HOM::Element.new(:input, {type: :text, size: 30})

  HOM::Element.new(:input, [{type: :text, size: 30}, :disabled])

The third constructor argument is the inner content, which can be a string,
another element object, or an array of child items. For example:

  span = HOM::Element.new(:span, nil, '')

  h1 = HOM::Element.new(:h1, {}, 'hello world')

  image = HOM::Element.new(:img, {src: 'image.png', width: 100, height: 30})

  link = HOM::Element.new(:a, {target: :_blank, href: '/'}, image)

  list = HOM::Element.new(:ul, nil, (1..3).map { |n| HOM::Element.new(:li, nil, n) })

Use HOM::Entity objects for HTML entities; integer values for numeric entities
and symbol/string values for named entities, for example:

  HOM::Element.new(:span, nil, HOM::Entity.new(160))

  HOM::Element.new(:span, nil, HOM::Entity.new(:nbsp))

Call #to_s or #html on a HOM::Element object to return a string containing
the generated HTML. HOM::Element objects are safe to use directly in Rails
templates, all escaping is handled automatically.
