HOM: A straightforward API for generating HTML
==============================================

Motivation
----------

HOM helps you implement HTML presentation logic in your code. Things like
navigation links, select boxes, sets of checkboxes; anything with behaviour
that is too complex for your templates.

Usage
-----

Build up an object tree using `HOM::Element` objects. The first constuctor
argument is a symbol representing the tag name. For example, here's how you'd
represent a line break element:

```ruby
HOM::Element.new(:br)
```

The second constructor argument represents the element attributes, and can be
nil, a single symbol/string, a hash, or an array of hashes and symbols/strings.
For example, here's how you'd represent some input elements:

```ruby
HOM::Element.new(:input, :disabled)

HOM::Element.new(:input, {type: :text, size: 30})

HOM::Element.new(:input, [{type: :text, size: 30}, :disabled])
```

The third constructor argument is the inner content, which can be a string,
another element object, or an array of child items. For example, here's how
you can represent elements with attributes:

```ruby
span = HOM::Element.new(:span, nil, '')

h1 = HOM::Element.new(:h1, {}, 'hello world')

image = HOM::Element.new(:img, {src: 'image.png', width: 100, height: 30})

link = HOM::Element.new(:a, {target: :_blank, href: '/'}, image)

list = HOM::Element.new(:ul, nil, (1..3).map { |n| HOM::Element.new(:li, nil, n) })
```

There's also a `HOM::Entity` class which you can use to represent HTML entities;
integer values for numeric entities and symbol/string values for named entities,
for example:

```ruby
HOM::Element.new(:span, nil, HOM::Entity.new(160))

HOM::Element.new(:span, nil, HOM::Entity.new(:nbsp))
```

Calling `#to_s` on a `HOM::Element` object will return a string containing
the generated markup. `HOM::Element` objects are safe to use directly in
Rails templates, all escaping is handled automatically.
