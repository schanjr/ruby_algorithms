# https://leetcode.com/problems/power-of-two/?envType=daily-question&envId=2024-02-19

def is_power_of_two(n)
  return true if n == 1
  n > 0 && (n & (n - 1)) == 0
end



puts is_power_of_two(2)
puts is_power_of_two(4)
puts is_power_of_two(5)
puts is_power_of_two(6)
puts is_power_of_two(128)
