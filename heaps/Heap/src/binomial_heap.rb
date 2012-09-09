require 'pp'
require_relative 'my_node.rb'
require './stack'


class BinomialHeap

  attr_accessor :root, :elements

  def initialize *args
    if args
      @root = args[0]
      @elements = args[1]
    else
      @root = nil
    end
  end

  def insert value, key
    pp "new node #{value} #{key}"
    new_node = MyNode.new value, key
    new_heap = BinomialHeap.new new_node, 1
    new_heap = union(self, new_heap)
    root = new_heap.root
    elements++
    new_node
  end

# @param [Object] node
# @param [Object] new_value
  def dec_key node, new_value
    if new_value < node.key
      node.key = new_value
      z = y.parent
      while z!=nil && y.key < z.key
        tmp_data = y.data
        tmp_key = y.key
        y.data = z.data
        y.key = z.key
        y = z
        z = y.parent
      end
    end
  end

  def delete node
    unless empty?
      dec_key node, -Float::INFINITY
      remove_min
    end
  end

  def empty?
    root is nil?
  end


  def link node1, node2
    node1.parent = node2
    node1.sibling = node2.child
    node2.child = node1
    node2.degree = node2.degree+1
  end

  def merge h1, h2
    puts "h1 #{h1}"
    puts "h1.root #{h1.root}"

    puts "h2 #{h2}"
    puts "h2.root #{h2.root}"

    nh1, nh2 = nil, nil
    nh1 = h1.root if h1 != nil && h1.root != nil
    nh2 = h2.root if h2 != nil && h2.root != nil
    return h2 if h1 == nil
    return h1 if h2 == nil

    puts "h1" if h1 == nil
    puts "h2" if h2 == nil
    puts "nh1" if nh1 == nil
    puts "nh2" if nh2 == nil
    h = nil
    if nh1.degree < h2.degree
      h = nh1
      nh1 nh1.sibling
    else
      h = nh2
      nh2 = nh2.sibling
    end
    curr = h
    while nh1 != nil && nh2 != nil
      if nh1.degree < nh2.degree
        curr.sibling = nh1
        curr = nh1
        nh1 = nh1.sibling
      else
        curr.sibling = nh2
        curr = nh2
        nh2 = nh2.sibling
      end
    end
    if h1 == nil
      curr.sibling = nh2
    else
      curr.sibling = nh1
    end
    return h
  end

  def min
    y = root
    x = root
    min = Float::INFINITY
    while x!=nil
      if x.key < min
        min = x.key
        y=x
      end
      x = x.sibling
    end
    return y
  end

  def print_heap
    if root != nil
      stack = Stack.new
      stack.push root
      while !stack.empty?
        curr = stack.pop
        pp curr
        if curr.sibling != nil
          stack push curr.sibling
        end
        curr = curr.child
        if curr != nil
          stack.push curr
        end
      end
    end

    def remove_min
      return nil if empty?
      prev, minP, curr, minC = nil, nil, @root, @root
      while curr != nil
        if curr.key < minC.key
          minC = curr
          minP = prev
        end
      end

      prev = curr
      curr = curr.sibling
      if minP == nil?
        root = root.sibling
      else
        minP.sibling = minC.sibling
      end
      newHeap = BinomialHeap.new(reverse(minC.child))
      curr = newHeap.rootNode
      while curr != nil
        curr.parent = nil
        curr = curr.sibling
      end
      minC.sibling = nil

      minC.child = nil
      minC.degree = 0
      newHeap = union(self, newHeap)
      rootNode = newHeap.rootNode
      numElements--
      minC
    end

    def reverse node
      if node != nil
        prev_node = nil
        current_node = node
        next_node = node.sibling

        while next_node != nil
          curr.sibling = prevN
          prev_node = current_node
          current_node = next_node
          next_node = curr.sibling
        end
        current_node.sibling = prev

      end
    end

    def size
      elements
    end
  end

  def union h1, h2
    h = BinomialHeap.new(merge(h1, h2), 0)
    if h.root == nil
      return h
    end
    h.elems = h1.elements + h2.elements

    prev_node = nil
    current_node = h.root
    next_node = curr.sibling

    while next_node != nil
      if current_node.degree != next_node.degree || next_node.sibling != nil && next_node.sibling.degree == current_node.degree
        prev_node = current_node
        current_node = next_node
      else
        if current_node.key <= next_node.key
          current_node.sibling = next_node.sibling
          link next_node, current_node
        else
          if prenN == nil
            h.root = next_node
          else
            prev_node.sibling = next_node
          end
          link current_node, next_node
          curr = next_node

        end

      end
      next_node = curr.sibling
    end
    h
  end
end

