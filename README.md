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

A pure Ruby implementation vs this crystal gem. See `./benchmark` file for full details. Run them with

```
./benchmark
```
Note it takes a while to run the full set, especially the memory ones.

### Iterations Per Second

- "" and "" Same-ish, often Ruby ~1.08x quicker (no type conversion overheads)
- "abd" and "abc" Crystal ~2x quicker
- "abcdefghi" and "0123456789" Crystal ~2.25x quicker
- [whole alphabet] vs "012345" Crystal ~2.37x quicker

### Memory

- "" and "" Same
- "abd" and "abc" Ruby 25.2x more
- "abcdefghi" and "0123456789" Ruby 141.5x more
- [whole alphabet] vs "012345" Ruby 212x more

See `./benchmark` file for full detailed results.

## Template

Based on [this](https://github.com/johansenja/crystal_gem_template) template for writing Ruby gems in Crystal.

## Contributions && Testing

Testing for now can just be done using Ruby:

`rspec`

Contributions are welcome.

## License

[MIT](https://rem.mit-license.org)
