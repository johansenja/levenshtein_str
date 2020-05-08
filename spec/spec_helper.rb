load "Rakefile"

RSpec.configure do |config|
  config.before(:suite) do
    Rake::Task["clean"].invoke
    Rake::Task["compile"].invoke
    require "levenshtein_str"
  end

  config.after(:suite) do
    # for some reason, this task never runs if just `invoke`d
    # Rake::Task["clean"].invoke
    system "rake clean"
  end
end
