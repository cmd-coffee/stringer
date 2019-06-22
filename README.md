# stringer

Useful utilities patched on top of the lovely [crystal's](https://crystal-lang.org/) [String](https://crystal-lang.org/reference/syntax_and_semantics/literals/string.html).

<img src="thomas-kelley-78865-unsplash.jpg" alt="Photo by Thomas Kelley on Unsplash" width="100%" />

## Project Health Status

[![CircleCI](https://circleci.com/gh/cmd-coffee/stringer.svg?style=shield)](https://circleci.com/gh/cmd-coffee/stringer)

## Getting Started

Add the dependency to your `shard.yml`:

```yaml
dependencies:
  stringer:
    github: cmd-coffee/stringer
```

Install your shards:

```sh
> shards install
```

Require it:

```crystal
require "stringer"
```

Strum along:

```crystal
strum = "The quick brown fox jumps over the lazy dog"
strum.truncate(28) # => "The quick brown fox jumps..."

strum = "  some \t\n messy\ttxt \n\t   "
strum.squish # => "some messy txt"
```

## Contributing

1. Fork it (<https://github.com/cmd-coffee/stringer/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
