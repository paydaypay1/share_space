# ShareSpace
Users can create shared spaces among other users. When working together, updates propogate to other users and cursors are visible. Similar to Figma or Google Suite collaboration.

The canvas editor supports 2D shapes (including polygons and straight, Bezier, and free-form lines), simple 3D primitives, rectangular clipping masks, symmetry and transform effects, and SVG, PNG, JPEG, WebP, and print-to-PDF export. Canvas changes and cursor positions are shared live over Action Cable.

The host Rails application must mount Action Cable at `/cable` and configure a shared Action Cable adapter (Redis in multi-process deployments) for collaboration across web workers. The channel checks `current_user` and canvas ownership/shares when the host connection exposes a signed-in user; standalone engine hosts should add an equivalent authorization check.

## Usage
TODO How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "share_space"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install share_space
```

## Contributing
TODO Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
