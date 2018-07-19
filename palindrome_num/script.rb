num = 121
next_num = num
digits = []
loop do
  remainder = next_num % 10
  p remainder
  break if remainder.zero?
  digits << remainder
  next_num = next_num / 10
  sleep 1
end
p digits
