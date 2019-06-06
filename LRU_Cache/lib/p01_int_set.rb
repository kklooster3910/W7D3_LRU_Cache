class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0, @max)

    store[num] = true
  end

  def remove(num)
    raise "Out of bounds" unless num.between?(0, @max)
    
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  # private

  # def is_valid?(num)
  # end

  # def validate!(num)
  # end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end
  
  def remove(num)
    @store[num % @store.length].delete(num) 
  end

  def include?(num)
    @store.each do |cup|
      return true if cup.include?(num)
    end

    false
  end
  
  private
  # optional but useful; return the bucket corresponding to `num`
  # def [](num)
  #   @store[num % num_buckets]
  # end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end


  def insert(num)
    return false if self.include?(num)

    @store[num % @store.length] << num
    # self[num] << num
    # self.[](num)
    @count += 1

    resize! if @store.length < @count
  end

  def remove(num)
    if self.include?(num)
      @store[num % store.length].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    return true if @store[num % @store.length].include?(num)
    false
  end

  private
  # optional but useful; return the bucket corresponding to `num`

  # def [](num)
  # end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(@store.length * 2) { Array.new }
    
    old_store.each do |bucket|
      bucket.each do |el|
        self.insert(el)
      end
    end
  end
end

