require 'spec_helper'
require './remove_element'

describe RemoveElement do
  test_suit = [
    {input: [[3, 2, 2, 3], 3], output: [[2, 2], 2]},
    {input: [[0, 1, 2, 2, 3, 0, 4, 2], 2], output: [[0, 1, 3, 0, 4], 5]},
    {input: [[6, 2, 8, 6, 9, 6, 1], 1], output: [[6, 2, 8, 6, 9, 6], 6]},
  ]

  shared_examples 'remove element method' do |method_name|
    test_suit.each do |test|
      context "for (#{test[:input][0]}, #{test[:input][1]})" do
        let(:array) { test[:input][0] }

        it "returns #{test[:output][1]}" do
          expect(
            described_class.public_send method_name, array, test[:input][1]
            ).to eq test[:output][1]
        end

        it 'modifies array' do
          described_class.public_send method_name, array, test[:input][1]
          expect(array).to eq test[:output][0]
        end
      end
    end
  end

  describe '.remove' do
    it_behaves_like "remove element method", 'remove'
  end

  describe '.remove_straight' do
    it_behaves_like "remove element method", 'remove_straight'
  end

  describe '.remove_reverse' do
    it_behaves_like "remove element method", 'remove_reverse'
  end
end
