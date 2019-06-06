class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self.include?(key) # O(1)

    self[key.hash] << key # O(1)
    @count += 1

    resize! if num_buckets < @count # O(n)
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return false if !self.include?(key)

    self[key.hash].delete(key)
    @count -= 1
  end

  private

  # optional but useful; return the bucket corresponding to `num`
  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(@store.length * 2) { Array.new }
    
    old_store.each do |bucket|
      bucket.each do |el| # O(1)
        self.insert(el)
      end
    end
  end
end
