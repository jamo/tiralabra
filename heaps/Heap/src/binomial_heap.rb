require 'pp'
require_relative 'my_node.rb'
require './stack'


class BinomialHeap

  attr_accessor :root, :elements

  def initialize *args

    @elements = 0
    if args
      @root = args[0]
      @elements = args[1]
    else
      @root = nil
      @elements = 0
    end
  end

  def insert value, key
    #pp "new node #{value} #{key}"
    new_node = MyNode.new value, key
    new_heap = BinomialHeap.new new_node, 1
    new_heap = union(self, new_heap)
    @root = new_heap.root
    if @elements == nil
      @elements = 0
    end
    @elements += 1
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
        z.data= tmp_data
        z.key = tmp_key
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
    root == nil
  end


  def link node1, node2
    node1.parent = node2
    node1.sibling = node2.child
    node2.child = node1
    node2.degree = node2.degree + 1
  end

  def merge h1, h2
    nh1, nh2 = nil, nil
    nh1 = h1.root if h1 != nil && h1.root != nil
    nh2 = h2.root if h2 != nil && h2.root != nil
    return nh2 if nh1 == nil
    return nh1 if nh2 == nil
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
    h
  end

  def min
    y = @root
    x = @root
    min = Float::INFINITY
    while x!=nil
      if x.key < min
        min = x.key
        y=x
      end
      x = x.sibling
    end
    y
  end

  def print_heap
    if root != nil
      stack = Stack.new
      stack.push @root
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
      prev, min_prev, curr, min_curr = nil, nil, @root, @root
      while curr != nil
        if curr.key < min_curr.key
          min_curr = curr
          min_prev = prev
        end
      end

      prev = curr
      curr = curr.sibling
      if min_prev == nil?
        @root = @root.sibling
      else
        min_prev.sibling = min_curr.sibling
      end
      new_heap = BinomialHeap.new(reverse(min_curr.child))
      curr = new_heap.root
      while curr != nil
        curr.parent = nil
        curr = curr.sibling
      end
      min_curr.sibling = nil

      min_curr.child = nil
      min_curr.degree = 0
      new_heap = union(self, new_heap)
      root = new_heap.root
      numElements--
      min_curr
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
        current_node.sibling = prev_node

      end
    end
  end


  def size
    elements
  end


  def union h1, h2
    h = BinomialHeap.new(merge(h1, h2), 0)
    if h.root == nil
      return h
    end


    h.elements += h1.elements if h1.elements
    h.elements +=  h2.elements if h2.elements

    prev_node = nil
    current_node = h.root
    next_node = current_node.sibling

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
          current_node = next_node

        end

      end
      next_node = current_node.sibling
    end
    h
  end
end


h = BinomialHeap.new
h.insert 22, 2
h.insert 21, 3
h.insert 20, 4
h.insert 19, 5
h.insert 23, 1
h.insert 24, 0

