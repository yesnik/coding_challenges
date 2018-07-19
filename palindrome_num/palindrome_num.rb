class PalindromeNum
  def self.palindrome?(num)
    return false if num < 0
    return false if !num.zero? && (num % 10).zero?

    reverted = 0

    while num > reverted
      reverted = reverted * 10 + num % 10
      num /= 10
    end
    
    num == reverted || num == reverted / 10
  end

  def self.palindrome_v1?(num)
    return false if num < 0 || ((num % 10).zero? && !num.zero?)

    next_num = num
    digits = []
    
    loop do
      remainder = next_num % 10

      break if remainder.zero? && next_num.zero?

      digits << remainder
      next_num = next_num / 10
    end
    
    digits == digits.reverse
  end
end
