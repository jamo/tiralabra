require 'pp'
class BinaryHeap
#maksimi binomikeko
#
#STAUS: Keon luonti ja Heapify toimii - uuden alkion tuonti kekoon siis
#       Keosta poistaminen toimii lähes kokonaan - EI KAI ENÄÄ Välillä left tuottaa has_bigger_children? metosta ArgumentError: wrong number of arguments (0 for 1)

  attr_accessor :heap
  @dbg = false
  def initialize
    @heap = Array.new
  end
  
  def heapify seed
    seed.each do |e|
      @heap.push e
      heapify_up(@heap.length-1)
    end
  end

  #def parent i
  #  @heap[(i/2).floor]
  #end
  
  #def left i
  #  @heap[2*i+1]
  #end
  
  #def right i
  #  @heap[2*i+2]
  #end

  def heapify_up index
    if index != 0 #on parent olemassa TODO 
      parent_index = (index/2).floor
      if @heap[parent_index] < @heap[index]           
        swap(index, parent_index)
        heapify_up(parent_index)
      end    
    end    
  end
  
  #debuggausta varten
  def get_heap
    @heap
  end
    
  def swap(first_index, second_index)
    @heap[first_index], @heap[second_index] = @heap[second_index], @heap[first_index]
  end

  def remove_max 
    deleted = @heap.delete_at 0
    if @heap.length > 0
      last_one = @heap.pop
      @heap.insert 0, last_one
      heapify_down 0
    end
    deleted
  end
  
  def heapify_down index
    if has_bigger_childen? index
      childs_index = get_index_of_biggest_child index
      swap index, childs_index
      heapify_down childs_index
    end
  end

  def has_bigger_childen? index
    return false if @heap.length < 2 * index + 2 #ei lapsia 
    return @heap[index] < @heap[2*index +1] if @heap.length == 2 * index + 2 #yksi lapsi
    pp "kaksi lasta index: #{index} Keon pituus: #{@heap.length}"
    left_child = @heap[2*index+1]
    right_child = @heap[2*index+2]
    return @heap[index] < [left_child, right_child].max
  end
  
  def get_index_of_biggest_child index
    return 2 * index + 1 if @heap.length == 2 * index + 2 #yksi lapsi
    if @heap[2 * index + 1] > @heap[2 * index + 2]
      return 2 * index + 1
    else
      return 2 * index + 2
    end
  end
end