require 'byebug'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > 0 && num < @max
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !include?(num)
  end

  def remove(num)
    self[num].delete(num) 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      resize!
    end
    if !include?(num)
      self[num] << num 
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store.concat(Array.new(num_buckets) { Array.new })
    (0...num_buckets/2).each do |idx|
      @store[idx].each do |num|
        # debugger
        @store[idx].delete(num)
        @count -= 1
        insert(num)
      end
    end
  end
end


# [ [4], [2,3], [1], [] ]
#    0      1    2    3
# .insert(5)
# k = 4
# n = 4

# [ [4], [2,3], [1], [1], [], [], [], [] ]
# k = 8
# n = 4

set = ResizingIntSet.new(20)
elements = (10..30).to_a
elements.each { |el| set.insert(el) }


