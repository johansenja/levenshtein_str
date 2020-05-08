require "./lib/levenshtein_str/version"

Gem::Specification.new do |s|
  s.name = "levenshtein_str"
  s.version = LevenshteinStr::VERSION
  s.licenses = %w[MIT]
  s.summary = "My first gem, written in crystal"
  s.description = "Features include: Greeting anyone of your choice"
  s.authors = %w[johansenja]
  s.files = Dir["./**/*"]
  s.extensions = %w[ext/levenshtein_str/extconf.rb]
  s.add_development_dependency "benchmark-ips"
end
