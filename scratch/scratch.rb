def three_sum(numbers)
  @sums = []
  calc(numbers, 0)
  @sums
end

def calc(numbers, target=0, partial=[])
  s = partial.sum
  if s == target && partial.length == 3
    @sums << partial
  end
  (0..(numbers.length - 1)).each do |i|
    n = numbers[i]
    remaining = numbers.drop(i+1)
    calc(remaining, target, partial + [n])
  end
end

# Two-pointer technique - O(n^2) time complexity
def three_sum_two_pointer(nums)
  result = []
  nums.sort!
  
  (0..(nums.length - 3)).each do |i|
    next if i > 0 && nums[i] == nums[i-1]
    
    left = i + 1
    right = nums.length - 1
    
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      
      if sum == 0
        result << [nums[i], nums[left], nums[right]]
        
        while left < right && nums[left] == nums[left + 1]
          left += 1
        end
        while left < right && nums[right] == nums[right - 1]
          right -= 1
        end
        
        left += 1
        right -= 1
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end
  
  result
end

puts "Original (O(n^3)): #{three_sum([-1,0,1,2,-1,-4])}"
puts "Two-pointer (O(n^2)): #{three_sum_two_pointer([-1,0,1,2,-1,-4])}"
