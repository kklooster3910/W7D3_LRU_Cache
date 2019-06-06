

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def inspect 
    {@key => key, @val => val}
  end
 
  def to_s
    "#{@key}: #{@val}"
  end

  # optional but useful, connects previous link to next link
  # and removes self from list.
  def remove
    
  end

end

class LinkedList

  attr_reader :head, :tail

  def initialize
    @head = Node.new #(:head) 
    @tail = Node.new #(:tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.empty? ? nil : @head.next
  end

  def last
    self.empty? ? nil : @tail.prev
  end

  def empty?
    @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
  end

  # tail.prev.next = new_node
  # gives us our last node - self.tail.prev 
  # last nodes next node will become the new node
  # Next points toward tail; prev points toward head
  
  def append(key, val)
    new_node = Node.new(key, val)       # change next and prev nodes for this node
    self.tail.prev.next = new_node      # need to change tail.prev and also need to change the next for prev last node
    new_node.next = self.tail
    new_node.prev = self.tail.prev
    self.tail.prev = new_node
  end

  def update(key, val)
    self.each { |nodey_boi| nodey_boi.val = val if nodey_boi.key == key }
  end

  def remove(key)
    
  end

  def each(&block)
    current_node = self.head.next
    while current_node != self.tail
      block.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
