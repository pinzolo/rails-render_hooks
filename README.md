# rails-render_hooks

[![Build Status](https://secure.travis-ci.org/pinzolo/rails-render_hooks.png)](http://travis-ci.org/pinzolo/rails-render_hooks)
[![Coverage Status](https://coveralls.io/repos/pinzolo/rails-render_hooks/badge.png)](https://coveralls.io/r/pinzolo/rails-render_hooks)

This gem provides new callbacks to your controller (on RoR).

## Installation

Add this line to your application's Gemfile:

    gem 'rails-render_hooks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-render_hooks

## Hooks

* before_render
* prepend_before_render
* skip_before_render
* after_render
* prepend_after_render
* skip_after_render
* around_render
* prepend_around_render
* skip_around_render

## Ordering of hooks

1. before_action (before_filter)
1. around_action (around_filter)
1. prepend_around_render
1. prepend_before_render
1. before_render
1. around_render
1. rendering
1. around_render
1. after_render
1. prepend_after_render
1. prepend_around_render
1. around_action (around_filter)
1. after_action (after_filter)

## Supported versions

* Ruby: 1.9.3, 2.0.0, 2.1.2
* Rails: 3.2.x, 4.0.x, 4.1.x

## Contributing

1. Fork it ( https://github.com/pinzolo/rails-render_hooks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Changelog

* v1.0.0 (2014-06-10 JST): First release
