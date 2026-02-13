# https://leetcode.com/problems/3sum/description/

def three_sum(nums)
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

three_sum([3,9,8,4,5,7,10],15)