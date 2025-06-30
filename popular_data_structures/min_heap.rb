# Heap is a data structure that has efficient insertion (usually n(logN)) and retrieval O(1)
# Heaps are commonly implemented using arrays in many programming languages.
# The array-based representation provides a more space-efficient and cache-friendly implementation compared to a tree-based representation.


# In an array-based implementation:
#
# The root of the heap is at index 0.
# For any element at index i:
# Its left child is at index 2i + 1.
# Its right child is at index 2i + 2.
# Its parent is at index (i - 1) / 2.


class MinHeap
  attr_accessor :heap

  def initialize
    @heap = []
  end

  def insert(key)
    @heap << key
    heapify_up(@heap.length - 1)
  end

  def extract_min(heap)
    return nil if heap.empty?

    min_value = heap[0]
    last_value = heap.pop

    unless heap.empty?
      heap[0] = last_value
      heapify_down(0)
    end

    min_value
  end


  def show_heap_sorted
    sorted_array = []
    heap_copy = @heap.dup

    until heap_copy.empty?
      sorted_array << extract_min(heap_copy)
    end

    sorted_array
  end

  private

  def heapify_up(index)
    parent_index = (index - 1) / 2

    while index > 0 && @heap[index] < @heap[parent_index]
      # Swap values
      @heap[index], @heap[parent_index] = @heap[parent_index], @heap[index]

      # Move up to the parent
      index = parent_index
      parent_index = (index - 1) / 2 # find next parent
    end
  end

  def heapify_down(index)
    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2
    smallest = index

    if left_child_index < @heap.length && @heap[left_child_index] < @heap[smallest]
      smallest = left_child_index
    end

    if right_child_index < @heap.length && @heap[right_child_index] < @heap[smallest]
      smallest = right_child_index
    end

    if smallest != index
      # Swap values
      @heap[index], @heap[smallest] = @heap[smallest], @heap[index]

      # Move down to the smallest child
      heapify_down(smallest)
    end
  end
end

# Example usage:
min_heap = MinHeap.new
min_heap.insert(4)
min_heap.insert(2)
min_heap.insert(7)
min_heap.insert(1)

puts min_heap.heap.to_s # Output: [1, 2, 7, 4]

min_value = min_heap.extract_min(min_heap.heap)
puts min_value # Output: 1
puts min_heap.heap # Output: [2, 4, 7]
