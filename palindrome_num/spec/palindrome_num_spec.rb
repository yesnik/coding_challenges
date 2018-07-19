require 'spec_helper'
require_relative './../palindrome_num'

test_suite = [
  [100, false],
  [121, true],
  [-121, false],
  [10, false],
  [19, false],
  [5, true],
  [1005001, true],
]

describe PalindromeNum do
  describe '.palindrome?' do
    test_suite.each do |test_case|
      it "returns #{test_case[1]} for #{test_case[0]}" do
        expect(described_class.palindrome?(test_case[0])).to eq test_case[1]
      end
    end
  end
end
