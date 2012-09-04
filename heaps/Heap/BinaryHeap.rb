require 'pp'
class BinaryHeap
#minimi binomikeko
#
#STAUS: Keon luonti ja Heapify toimii - uuden alkion tuonti kekoon siis
#       Keosta poistaminen ei vielä mahdollista.

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

  def parent i
    @heap[(i/2).floor]
  end
  
  def left i
    @heap[2*i]
  end
  
  def right i
    @heap[2*i+1]
  end

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
#   jos toinen lapsista isompi kuin @heap[index] 
#     valitaan niistä isompi
#     vaihdentaan näitä sen kanssa
#     ja heapify_down sen indeksille  
  end  

  def has_bigger_childen? index
    if left(index) and not right(index) #on vain yksi lapsi
  end
