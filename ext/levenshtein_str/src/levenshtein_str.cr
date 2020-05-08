require "./lib/cr_ruby"

def levenshtein(first : String, second : String)
  len1, len2 = first.size, second.size
  return len1 if len2.zero?
  return len2 if len1.zero?

  matrix = [(0..len1).to_a]
  (1..len2).each do |j|
    matrix << [j] + [0] * len1
  end

  (1..len2).each do |i|
    (1..len1).each do |j|
      if first[j-1] == second[i-1]
        matrix[i][j] = matrix[i-1][j-1]
      else
        matrix[i][j] = {
          matrix[i-1][j],
          matrix[i][j-1],
          matrix[i-1][j-1]
        }.min + 1
      end
    end
  end
  return matrix.last.last
end

def levenshtein(self : CrRuby::VALUE, other : CrRuby::VALUE)
  levenshtein(String.from_ruby(self), String.from_ruby(other)).to_ruby
end

fun init = Init_levenshtein_str
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)

  string = CrRuby.rb_define_class("String", CrRuby.rb_cObject)
  CrRuby.rb_define_method(string, "levenshtein", ->levenshtein(CrRuby::VALUE, CrRuby::VALUE), 1)
end
