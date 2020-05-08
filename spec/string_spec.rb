require_relative "./spec_helper"

RSpec.describe String do
  describe "#levenshtein" do
    context "with one empty string" do
      it "returns the other string's length" do
        expect("".levenshtein("abc")).to eq 3
        expect("abc".levenshtein("")).to eq 3
      end
    end

    context "with two equal strings" do
      it "returns 0 if empty" do
        expect("".levenshtein("")).to eq 0
      end

      it "returns 0 if not empty" do
        expect("abc".levenshtein("abc")).to eq 0
      end
    end

    context "with 2 same length strings" do
      it "can accurately return the difference" do
        # c => p
        # d => w
        # h => l
        expect("abcdefgh".levenshtein("abpwefgl")).to eq 3
      end
    end

    context "with 2 varying length strings" do
      it "returns the length dfference if otherwise the same" do
        expect("abcde".levenshtein("abc")).to eq 2
      end

      it "correctly evaluates complex strings" do
        expect("abcdefghijklmnop".levenshtein("435hq09yrz")).to eq 15
      end
    end
  end
end
