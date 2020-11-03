# 1.3.1

* Added metadata to gemspec

# 1.3.0

* HOM::NodeList#join now returns a new node list

* Added plus method to HOM::Element

* Added plus method to HOM::Entity

# 1.2.0

* Added html_safe? methods to HOM::Element and HOM::NodeList for compatibility with [erubis-auto](https://github.com/timcraft/erubis-auto)

# 1.1.0

* Added HOM::NodeList class

# 1.0.0

* Ruby 1.8.7 compatibility

* Removed support for rendering arbitrary objects by calling #html

# 0.4.0

* Deprecated support for rendering arbitrary objects by calling #html

* Added notion of undefined content, changing how elements with nil content are rendered:

  With an element like this: `HOM::Element.new(:h1, {}, nil)`

  Pre v0.4.0 rendering: `<h1>`

  Post v0.4.0 rendering: `<h1></h1>`

# 0.3.0

* Added notion of undefined attribute values, nil is now rendered as an empty value:

  With an element like this: `HOM::Element.new(:input, {:value => nil})`

  Pre v0.3.0 rendering: `<input value>`

  Post v0.3.0 rendering: `<input value="">`

* Removed Element#lookup method

# 0.2.0

* Replaced method missing attribute access with Element#lookup method

# 0.1.0

* First version!
