require "./lib/levenshtein_str/version"

Gem::Specification.new do |s|
  s.name = "levenshtein_str"
  s.version = LevenshteinStr::VERSION
  s.licenses = %w[MIT]
  s.summary = "Get the Levenshtein distance between two strings"
  s.description = "Use String#levenshtein(other_str) to get the levenshtein distance between 2 strings. Useful for measuring approximate string similarity, and fuzzy matching."
  s.authors = %w[johansenja]
  s.files = %w[Gemfile README.md Gemfile.lock Rakefile benchmark].concat(Dir["lib/**/*"]).concat(Dir["ext/**/*"])
  s.test_files = Dir["spec/**/*.rb"]
  s.extensions = %w[ext/levenshtein_str/extconf.rb]
  s.metadata = { "source_code_uri" => "https://github.com/johansenja/levenshtein_str" }
  s.homepage = "https://github.com/johansenja/levenshtein_str"
  s.add_development_dependency "benchmark-ips", "~> 2.7"
  s.add_development_dependency "benchmark-memory", "~> 0.1.2"
end
