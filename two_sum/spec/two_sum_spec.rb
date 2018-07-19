require 'spec_helper'
require_relative './../two_sum'

describe TwoSum do
  describe '.calculate' do
    let(:test_cases) {
      [
        # [[2, 7, 11, 15], 9, [0, 1]],
        #[[1, 12, 8], 9, [0, 2]],
        #[[4, 5, 3, 1], 4, [2, 3]],
        #[[-5, 4, -2], 2, [1, 2]],
        #[[1, 5], 10, []],
        [[2, 2], 4, [0, 1]],
      ]
    }

    it 'returns array or results' do
      test_cases.each do |variant|
        # byebug
        expect(
          described_class.calculate(variant[0], variant[1])
          ).to eq variant[2]
      end
    end
  end
end

# Given nums = [2, 7, 11, 15], target = 9,

# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1]
