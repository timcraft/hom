# [v1.3.0](https://github.com/timcraft/hom/tree/v1.3.0) (2013-06-10) [e2138a6](https://github.com/timcraft/hom/commit/e2138a6f523b4be11e512fe813edbbd0131c40bf)

  * HOM::NodeList#join now returns a new node list

  * Added plus method to HOM::Element

  * Added plus method to HOM::Entity

# [v1.2.0](https://github.com/timcraft/hom/tree/v1.2.0) (2013-05-29) [f0c32bb](https://github.com/timcraft/hom/commit/f0c32bb04a05bbf4028d637c7eecfe967ee17aa3)

  * Added html_safe? methods to HOM::Element and HOM::NodeList for
    compatibility with [erubis-auto](https://github.com/timcraft/erubis-auto)

# [v1.1.0](https://github.com/timcraft/hom/tree/v1.1.0) (2013-03-30) [b8ed642](https://github.com/timcraft/hom/commit/b8ed642cf60c72bc0cdf0ae9e312b4d6e304e251)

  * Added HOM::NodeList class

# [v1.0.0](https://github.com/timcraft/hom/tree/v1.0.0) (2013-02-16) [ab4bc2d](https://github.com/timcraft/hom/commit/ab4bc2deec73329415d6d41501239dd734dc202d)

  * Ruby 1.8.7 compatibility

  * Removed support for rendering arbitrary objects by calling #html

# [v0.4.0](https://github.com/timcraft/hom/tree/v0.4.0) (2012-09-26) [a4652af](https://github.com/timcraft/hom/commit/a4652af51ada2e6c38960d6658ab3c0ccf7cc153)

  * Deprecated support for rendering arbitrary objects by calling #html

  * Added notion of undefined content, changing how elements with nil content are rendered:

    With an element like this: `HOM::Element.new(:h1, {}, nil)`

    Pre v0.4.0 rendering: `<h1>`

    Post v0.4.0 rendering: `<h1></h1>`

# [v0.3.0](https://github.com/timcraft/hom/tree/v0.3.0) (2012-02-23) [52e3ab0](https://github.com/timcraft/hom/commit/52e3ab0845c075a90ebd0e90e45752cbb777250f)

  * Added notion of undefined attribute values, nil is now rendered as an empty value:

    With an element like this: `HOM::Element.new(:input, {:value => nil})`

    Pre v0.3.0 rendering: `<input value>`

    Post v0.3.0 rendering: `<input value="">`

  * Removed Element#lookup method

# [v0.2.0](https://github.com/timcraft/hom/tree/v0.2.0) (2012-01-20) [6b33d90](https://github.com/timcraft/hom/commit/6b33d907a1809eac5c50ef52741d6c59cb6ef013)

  * Replaced method missing attribute access with Element#lookup method

# [v0.1.0](https://github.com/timcraft/hom/tree/v0.1.0) (2011-08-19) [d44b625](https://github.com/timcraft/hom/commit/d44b6250a58c0fd1ef51200dd2372ee2c3442379)

  * First version!
