require "bundler/gem_tasks"

desc "compile the Crystal native extensions"
task :compile do
  puts "compiling native extensions"
  `cd ext/levenshtein_str && shards && make clean && make & cd ../../`
end

desc "cleaning up compiled binaries"
task :clean do
  puts "cleaning up extensions"
  `cd ext/levenshtein_str && make clean && cd ../../`
end
