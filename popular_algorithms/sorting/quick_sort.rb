# animation: https://www.hackerearth.com/practice/algorithms/sorting/quick-sort/visualize/
# Main Ideas:
# There is a pivot point chosen. This can be random or just the last element for simplicity.
# The partition function can return the pivot location at the end of partition loops.
# At the end one partition loop, all elements to the left of the pivot element should be less than the pivot.
# All elements to the right of the pivot element should be more than the pivot.
# The partition return function needs to return the pivot.
# Quick sort is the default sort algorithm for standard libraries.
def quick_sort(array, first, last)
  if first < last
    j = partition(array, first, last)
    puts "*" * 50

    quick_sort(array, first, j - 1)
    quick_sort(array, j + 1, last)
  end
  array
end

def partition(array, first, last)
  puts "-" * 100
  puts "sorting contents #{array[first..last]} pivot: [#{array[last]}]"
  arr_beginning = array.dup

  left = first
  right = first
  while right < last
    puts "##### starting index positions: left: #{left}, right:#{right}"
    if array[right] <= array[last] # array last is pivot
      if left != right
        ###################### for visual purposes ###########################
        puts "Swapping inner loop: "                                         #
        puts "left index: #{left}      right index: #{right}"                #
        str_put = "["                                                        #
        0.upto(array.size - 1).each do |i|                              #
          if i == left || i == right                                         #
            str_put += ">#{array[i]}<"                                       #
          else                                                               #
            str_put += "#{array[i]}"                                         #
          end                                                                #
          str_put += ", " unless i == array.size - 1                        #
        end                                                                  #
        str_put += "]"                                                       #
        puts str_put + " pivot [#{array[last]}]"                             #
        ######################################################################
        array[right], array[left] = array[left], array[right]
      end
      left += 1
    end
    right += 1
    puts "##### ending index positions:   left: #{left}, right:#{right}"
    puts
  end
  # swap left and pivot at the end of loop
  puts "Exchanging Pivot: left index: #{left} last: #{last}"
  array[left], array[last] = array[last], array[left]

  puts "partition beginning: #{arr_beginning.to_s}"
  puts "partition    ending: #{array.to_s}"
  puts "-" * 100
  puts
  left
end



def quick_sort_simple(arr)
  if arr.length <= 1
    return arr
  end
  pivot = arr.pop
  less = []
  greater = []
  arr.each do |x|
    if x <= pivot
      less << x
    else
      greater << x
    end
  end
  quick_sort_simple(less) + [pivot] + quick_sort_simple(greater)
end


arr = [20, 21, 4, 5, 8, 10, 3, 3, 2, 1, 12, 18, 7]
arr2 = arr.dup
puts "quick sort pointer method" , quick_sort(arr, 0, arr.size - 1).to_s
puts "quick sort simple array method", quick_sort_simple(arr2).to_s

