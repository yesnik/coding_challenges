class RemoveElement
  def self.remove(nums, val)
    nums.delete_if { |n| n == val }
    nums.size
  end

  def self.remove_straight(nums, val)
    i = 0
    n = nums.size

    while i < n
      if nums[i] == val
        nums[i] = nums[n - 1]
        n -= 1
      else
        i += 1
      end
    end
    n
  end

  def self.remove_reverse(nums, val)
    i = 0
    j = 0

    loop do
      break unless nums[i]

      if nums[j] == val
        nums.delete_at(j)
      else
        nums[i] = nums[j]
        i += 1
        j += 1
      end
    end
    i
  end
end
