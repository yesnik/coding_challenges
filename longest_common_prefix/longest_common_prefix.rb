class LongestCommonPrefix
  # Horizontal scanning. Fast
  def self.find(words)
    return '' if words.empty?

    prefix = words.first

    words[1..-1].each do |word|
      # while word.index(prefix) != 0
      while !word.start_with? prefix
        prefix = prefix[0..-2]
        return '' if prefix.empty?
      end
    end
    prefix
  end

  # Binary search. Not so fast
  def self.binary_find(words)
    return '' if words.empty?

    length_min = words.map(&:size).min
    low = 0
    high = length_min

    while low <= high
      middle = (low + high) / 2

      if common_prefix?(words, middle)
        low = middle + 1
      else
        high = middle - 1
      end
    end

    return '' if high < 0

    words.first[0..(low + high) / 2]
  end

  def self.common_prefix?(words, len)
    first_word = words.first[0..len]

    return false if first_word.empty?

    words[1..-1].each do |word|
      if word && word.index(first_word) != 0
        return false
      end
    end
    true
  end

  # Divide and conquer technique. Not so fast
  def self.divide_conquer_find(words)
    return '' if words.empty?
    longest_common_prefix(words, 0, words.size - 1)
  end

  def self.longest_common_prefix(words, l, r)
    if l == r
      return words[l]
    else
      middle = (l + r) / 2
      lcp_left = longest_common_prefix(words, l, middle)
      lcp_right = longest_common_prefix(words, middle + 1, r)
      return common_prefix(lcp_left, lcp_right)
    end
  end

  def self.common_prefix(left, right)
    min = [left.size, right.size].min

    (0...min).each do |n|
      if left[n] != right[n]
        return left[0...n]
      end
    end
    return left[0...min]
  end


  # Vertical scanning. Not fast.
  def self.vertical_scanning_find(words)
    return '' if words.empty?

    i = 0
    prefix = ''
    first_word = words.first

    loop do
      current_letter = first_word[i]
      
      if words.all? { |word| current_letter && word[i] == current_letter }
        prefix = prefix + current_letter
      else
        return prefix
      end

      i += 1
    end
  end

  # Slow
  def self.find_custom(words)
    return '' if words.empty?

    prefix = words.max { |x| x.size }

    while !prefix.empty? do
      return prefix if words.all? { |word| word =~ /^#{prefix}/ }

      prefix = prefix[0..-2]
    end
    ''
  end
end
