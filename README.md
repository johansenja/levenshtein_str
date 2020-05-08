# String#levenshtein

A performant Ruby gem for getting the [levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) between 2 strings, with the leg work done in Crystal.

## Installation:

### System Requirements

- crystal
- MacOS (untested in Linux)

```ruby
# Gemfile
gem "levenshtein_str"
```

then

`bundle install`

## Usage:

```ruby
# app.rb
require 'levenshtein_str'

puts "hello".levenshtein("world")
```

then

`ruby app.rb # => 4`

## Benchmarks

See benchmark.rb for more code info and full results.

`./benchmark`

- "" and "" Same-ish, sometimes Ruby fractionally quicker (no type conversion overheads)
- "abd" and "abc" Crystal ~2x quicker
- "abc" and "abcde" Crystal ~2x quicker
- "abcdefghi" and "0123456789" Crystal ~2.25x quicker
- [whole alphabet] vs "012345" Crystal ~2.37x quicker

## Template

Based on [this](https://github.com/johansenja/crystal_gem_template) template for writing Ruby gems in Crystal.

## Contributions && Testing

Testing for now can just be done using Ruby:

`rspec`

Contributions are welcome.

## License

[MIT](https://rem.mit-license.org)
