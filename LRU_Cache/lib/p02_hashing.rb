require "byebug"

class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_val = 0

    self.each_with_index do |el, i|
      hash_val += (el.hash * i.hash)
    end

    hash_val
  end
end

class String
  def hash
    hash_val = 0
    self.each_char.with_index do |char, idx|
      hash_val += (char.ord * idx.hash)
    end
    hash_val
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.to_a

    arr.sort.hash
  end
end
