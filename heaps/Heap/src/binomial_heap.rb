require_relative 'node.rb'
class BinomialHeap
  attr_accessor :root_node, :elements

  def initialize *args
    if args
      @root_node = args[0]
      @elements = args[1]
    end
  end

  def make_heap
    h = BinomialHeap.new
    h.root_node = nil
    h
  end

  #pseudon mukainen
  def insert x
    x = Node.new x
    h = make_heap
    x.parent = nil
    x.child = nil
    x.sibling = nil
    x.degree = 0
    h.root_node = x
    @root_node = union self, h
    x
  end

  #pseudon mukainen
  def minimum
    y = nil
    x = @root_node
    min = Float::INFINITY #mahd iso arvo
    while x != nil
      if x.key < min
        min = x.key
        y = x
      end
      x = x.sibling
    end
    y
  end

  #pseudon mukainen
  def link y, z
    y.parent = z
    y.sibling = z.child
    z.child = y
    z.degree = z.degree + 1
  end

  #pseudomainen TODO
  def extract_min
    return nil unless @root_node.sibling
    x = @root_node
    y= x.sibling
    pred = x
    xpred = nil
    
    while y!=nil
      if y.key < x.key
        x=y
        xpred = pred
      end
      pred = y
      y = y.sibling
    end
    remove_from_root_list x, xpred
    x
  end



 
  def remove_from_root_list x, pred
    if x==@root_node
      @root_node = @root_node.sibling
    else
      pred.sibling = x.sibling
    end
    hh = BinomialHeap.new
    z = x.child
    while z != nil
      nextt = z.sibling
      hh.root_node = z
      z = nextt
    end
    @root_node = union(self, hh)
  end

  #pseudon mukainen
  def union h1, h2
    h = BinomialHeap.new
    h.root_node = merge h1, h2
    return h if h.root_node == nil
    prev_x = nil
    x = h.root_node
    next_x = x.sibling

    while next_x != nil
      if (x.degree != next_x.degree) or (next_x.sibling != nil and next_x.sibling.degree == x.degree)
        prev_x = x
        x = next_x
      else
        if x.key <= next_x.key
          x.sibling = next_x.sibling
          link next_x, x
        else
          if prev_x == nil
            h.root_node = next_x
          else
            prev_x.sibling = next_x
          end
          link x, next_x
          x = next_x
        end
      end
      next_x = x.sibling
    end
    h.root_node
  end

  #pseudon mukainen
  def dec_key x, k
    if k < x.key
      x.key = k
      y = x
      z = y.parent
      while z != nil and y.key < z.key
        y.key, z.key = z.key, y.key
        y = z
        z = y.parent
      end
    end
  end

  def delete x
    dec_key x, -Float::INFINITY
    extract_min
  end

  def merge h1, h2
    if h1 == nil or h2 == nil or h1.root_node == nil or h2.root_node == nil
      nh1, nh2 = nil, nil
      nh1 = h1.root_node if h1 != nil && h1.root_node != nil
      nh2 = h2.root_node if h2 != nil && h2.root_node != nil
      return nh2 if nh1 == nil
      return nh1 if nh2 == nil
    end
    #nyt tiedetään et noi olemassa - pienempi riski hajoomiseen

    h = make_heap
    if h2.root_node.key < h1.root_node.key
      h.root_node = h2.root_node
      curr2 = h2.root_node.sibling
      curr1 = h1.root_node
    else
      h.root_node = h1.root_node
      curr1 = h1.root_node.sibling
      curr2 = h2.root_node
    end
    curr = h.root_node

    while curr1 != nil and curr2 != nil
      if curr1.key > curr2.key
        curr.sibling = curr2
        curr = curr.sibling
        curr2 = curr2.sibling
      else
        curr.sibling = curr1
        curr = curr.sibling
        curr1 = curr1.sibling
      end
    end
    if curr1 == nil
      tail = curr2
    else
      tail = curr1
    end
    while tail != nil
      curr.sibling = tail
      curr = curr.sibling
      tail = tail.sibling
    end
    h.root_node
  end
end

h = BinomialHeap.new
h.insert 22
