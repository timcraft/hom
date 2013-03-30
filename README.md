hom
===


A straightforward API for generating HTML.


Motivation
----------

HOM helps you implement HTML presentation logic in your code. Things like
navigation links, select boxes, sets of checkboxes; anything with behaviour
that is too complex for your templates.


Installation
------------

    $ gem install hom


Quick start
-----------

```ruby
require 'hom'

puts HOM::Element.new(:h1, nil, 'hello world')
```


Using HOM::Element
------------------

Create instances of HOM::Element to represent DOM elements. The first
constructor argument is a symbol representing the tag name. For example,
you can represent a line break element like this:

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
another element object, or an array of child nodes. For example, here's how
you can represent various elements with inner content:

```ruby
span = HOM::Element.new(:span, nil, '')

h1 = HOM::Element.new(:h1, {}, 'hello world')

image = HOM::Element.new(:img, {src: 'image.png', width: 100, height: 30})

link = HOM::Element.new(:a, {target: :_blank, href: '/'}, image)

list = HOM::Element.new(:ul, nil, (1..3).map { |n| HOM::Element.new(:li, nil, n) })
```

Calling #to_s on a HOM::Element object will return a string containing the
generated HTML markup. HOM::Element objects are safe to use directly in Rails
templates, all escaping is handled automatically.


Using HOM::Entity
-----------------

Create instances of HOM::Entity to represent HTML entities. Use an integer
argument for numeric entities and a symbol/string argument for named entities,
for example:

```ruby
HOM::Entity.new(160)

HOM::Entity.new(:nbsp)
```


Using HOM::NodeList
-------------------

Use HOM::NodeList to group nodes together without having to wrap them in an
outer element. For example:

```ruby
HOM::NodeList.new(['This is a ', HOM::Element.new(:strong, nil, 'Contrived'), ' example'])
```

Calling #to_s on a HOM::NodeList object will return a string containing the
generated HTML markup. Calling #join will insert separator nodes, a bit like
Array#join, but returning HTML safe output.
