require 'spec_helper'
require_relative './../longest_common_prefix'

test_suite = [
  [%w(flower flow flight), 'fl'],
  [%w(hello help helicopter), 'hel'],
  [%w(drop taxi hold), ''],
  [%w(america africa), 'a'],
  [%w(), ''],
  [%w(c acc ccc), ''],
  [%w(hello helicopter help helen helly), 'hel'],
]

describe LongestCommonPrefix do
  describe '.find' do
    test_suite.each do |test_case|
      it "returns #{test_case[1]} for #{test_case[0]}" do
        expect(
          described_class.find(test_case[0])
          ).to eq test_case[1]
      end
    end
  end
end
