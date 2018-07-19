require 'spec_helper'
require './longest_substring'

describe LongestSubstring do
  test_cases = [
    ['abaxac', 3],
    ['abcabcbb', 3],
    ['bbbb', 1],
    ['pwwkew', 3],
    ['', 0],
    ['ohomm', 3]
  ]

  shared_examples_for 'find substring' do |method_name|
    test_cases.each do |test|
      context "when string is #{test.first}" do
        it do
          expect(described_class.public_send method_name, test.first).
            to eq test.last
        end
      end
    end
  end

  describe '.find' do
    it_behaves_like 'find substring', 'find'
  end

  describe '.find_offset' do
    it_behaves_like 'find substring', 'find_offset'
  end

  describe '.find_with_two_pointers' do
    it_behaves_like 'find substring', 'find_with_two_pointers'
  end

  describe '.find_ij' do
    it_behaves_like 'find substring', 'find_ij'
  end
end
