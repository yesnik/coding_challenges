class TwoSum
  def self.calculate(nums, target)
    # brut_force(nums, target)
    # two_pass_hash_table(nums, target)
    one_pass_hash_table(nums, target)
  end

  protected

  def solution(numbers, target)
    nums = numbers.dup
    result = []

    while first_num = nums.pop
      nums.each do |second_num|
        if first_num + second_num == target
          first_num_index = numbers.index(first_num)

          return [
            first_num_index,
            numbers.rindex(second_num)
          ].sort
        end
      end
    end
    []
  end

  def self.one_pass_hash_table(nums, target)
    map = []
    nums.each_with_index do |n, i|
      complement = target - n
      if map[complement]
        return [map[complement], i]
      end
      map[n] = i
    end
  end

  def self.two_pass_hash_table(nums, target)
    map = {}
    nums.each_with_index do |n, i|
      map[n] = i
    end

    nums.each_with_index do |n, i|
      complement = target - n

      if map[complement] && map[complement] != i
        return [i, map[complement]]
      end
    end
  end

  def self.brut_force(numbers, target)
    numbers.each do |a|
      numbers.each do |b|
        next if a + b != target
        return [numbers.index(a), numbers.rindex(b)]
      end
    end
  end
end
