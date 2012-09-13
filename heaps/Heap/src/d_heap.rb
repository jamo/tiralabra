require 'pp'
require 'ruby-debug'
class DHeap
  attr_accessor :heap, :d

  @dbg = false

  def initialize d
    @heap, @d = Array.new, d
  end


  #def parent i   #Jääkööt tähän, vaikkakin turha
  #  @heap[parent_index i]
  #end

  def parent_index index
    return 0 if index == 0 ##poikkeustapaus - tähän ei pitäisi päätyä
    ((index-1).to_f/@d).floor
  end

  def child_index index
    child_index_left(index) .. child_index_right(index) #n on keon solmujen määrä
  end

  def child_index_left index
    [@d * index + 1, @heap.length-1].min
    #@d * ( index - 1 ) + 2
  end

  def child_index_right index
    #@d*index +@d
    [@d*index+@d, @heap.length-1].min
  end

  def heapify *seed #saadaan joko taulukko tai nkpl arvoja jotka päätyvät taulukkoon :)
    seed.each do |e|
      @heap.push e
      heapify_up(@heap.length-1)
    end
  end

  def remove_max
    return nil if heap.empty?
    deleted = @heap.delete_at 0
    last_one = @heap.pop
    if last_one
      @heap.insert 0, last_one
      heapify_down 0
    end
    deleted
  end

  def inc_key new_value, index
    return nil unless @heap[index]
    if @heap[index] < new_value
      @heap[index] = new_value
      heapify_up index
    end
  end

  def dec_key new_value, index
    return nil unless @heap[index]
    if @heap[index] > new_value
      @heap[index] = new_value
      heapify_down index
    end
  end

  def swap(first_index, second_index)
    @heap[first_index], @heap[second_index] = @heap[second_index], @heap[first_index]
  end

  def heapify_up index
    if index != 0 #on parent olemassa TODO
      parent_i = parent_index index
      if @heap[parent_i] < @heap[index]
        swap(index, parent_i)
        heapify_up(parent_i)
      end
    end
  end

  def heapify_down index
    if has_bigger_childen? index
      #puts "sisalla hepify_downissa #{index}"
      #pp index
      indexes = get_index_of_biggest_child index
      return unless indexes # jos childs_index on nil tai false returnataan
      swap index, indexes
      heapify_down indexes
    end
  end

  def has_bigger_childen? index
    childs = Hash.new
    for i in child_index index
      childs[i] = @heap[i]
    end
    nil if childs == [] or childs.values == nil or (child_index(index)).max == @heap.length


    @heap[childs.values.max]
    @heap[index] < childs.values.max
  end

  def get_index_of_biggest_child index
    childs = Hash.new
    for i in child_index_left(index)..child_index_right(index)
      childs[i] = @heap[i]
    end
    childs.key childs.values.max
  end

  def empty?
    heap.empty?
  end

  def not_empty?
    !empty?
  end

  def clear!
    heap.clear
  end

  def inject_heap new_heap
    @heap = new_heap
  end

  def peak
    @heap[0]
  end

end
