class LongestSubstring
  def self.find(s)
    base_idx = 0
    max_len = 0
    m = {}
    
    n = s.size
    
    (0...n).each do |i|
      char = s[i]
      last_seen_index_of_c = m[char]

      if last_seen_index_of_c && last_seen_index_of_c >= base_idx
        l = i - base_idx
        max_len = [max_len, l].max
        base_idx = last_seen_index_of_c + 1
      end

      m[char] = i
    end

    l = n - base_idx
    [max_len, l].max
  end

  # 124 ms.
  def self.find_ij(s)
    n = s.size
    set = {}
    ans = i = j = 0

    while i < n && j < n
      # try to extend the range [i, j]
      if set[ s[j] ]
        set.delete s[i]
        i += 1
      else
        set[ s[j] ] = 1
        j += 1
        ans = [ans, (j - i)].max
      end
    end
    ans
  end

  # Time: 760 ms. Very slow
  def self.find_offset(s)
    return 0 if s.empty?
    letters = s.split('')
    cache = {}
    length_values = []
    offset = 0

    while offset < s.size
      letters[offset..-1].each do |letter|
        if cache[letter]
          length_values << cache.size
          cache = {}
          offset += 1
          break
        else
          cache[letter] = 1
        end
      end
    end
    length_values.max
  end

  # Time Limit Exceeded
  def self.find_with_two_pointers(s)
    p1 = 0
    p2 = 0
    map = {}
    maxx = 0

    while p2 < s.size
      next_char = s[p2...(p2 + 1)]

      if map[next_char]
        steps = p2 - p1
        maxx = [steps, maxx].max

        p1 += 1
        p2 = p1
        map = {}
      else
        map[next_char] = 1
        p2 += 1
      end
    end

    steps = p2 - p1
    maxx = [steps, maxx].max
    maxx
  end
end
