require 'pp'
require 'ruby-debug'
class DHeap
  attr_accessor :heap, :d

  @dbg = false

  ##
  #Luodaan keon oleellisimat komponentit
  # @param [Fixnum]  lasten määrä
  def initialize d
    @heap, @d = Array.new, d
  end


  #def parent i   #Jääkööt tähän, vaikkakin turha
  #  @heap[parent_index i]
  #end

  ##
  # Palauttaa parentin indexin
  #
  # @param [Fixnum]  parentin indeksin laskentaan
  def parent_index index
    return 0 if index == 0 ##poikkeustapaus - tähän ei pitäisi päätyä
    ((index-1).to_f/@d).floor
  end

  ##
  # Palauttaa lasten indeksivälin jota voidaan hyödyntää lasten läpikäynnisä
  # luku..toinen_luku
  # @param [Fixnum]  indeksi, jonka lasten väli lasketaan
  def child_index index
    child_index_left(index) .. child_index_right(index) #n on keon solmujen määrä
  end

  ##
  # Palauttaa vasemmal lapsen indeksin
  # @param [Fixnum] indeksi, jonka lapsen indeksi lasketaan
  def child_index_left index
    [@d * index + 1, @heap.length-1].min
    #@d * ( index - 1 ) + 2
  end

  ##
  # Palauttaa vasemman lapsen indeksin
  # @param [Fixnum]  indeksi, jonka oikea indeksi lasketaan
  def child_index_right index
    #@d*index +@d
    [@d*index+@d, @heap.length-1].min
  end

  ##
  #  Metodi, joka lisää alkioita heap taulukkoon.
  #  Voidaan kutsua myös sorituksen aikana.
  # @param [Array]  n klp argumenttejä. jotka lisätään taulukkoon.
  def heapify *seed #saadaan
    seed.each do |e|
      @heap.push e
      heapify_up(@heap.length-1)
    end
  end

  ##
  # Poistaa ja palauttaa suurimman arvon omaavan elementin keosta
  # Huolehtii kekoehdon toiminnasta
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

  ##
  # Kasvattaa avaimen arvoa tietyssä indeksissä
  # Mikäli uusi arvo on pienempi kuin uusi arvo ei tehdä mitään
  # @param [Fixnum] new_value uusi arvo joka muutetaan vanhan tilalle
  # @param [Fixnum] index, indeksi jossa olevaa avainta muutetaan
  def inc_key new_value, index
    return nil unless @heap[index]
    if @heap[index] < new_value
      @heap[index] = new_value
      heapify_up index
    end
  end

  ##
  # Pienentää avaimen arvoa tietyssä indeksissä
  # Mikäli uusi arvo on suurempi kuin uusi arvo ei tehdä mitään
  # @param [Fixnum] new_value uusi arvo joka muutetaan vanhan tilalle
  # @param [Fixnum] index, indeksi jossa olevaa avainta muutetaan
  def dec_key new_value, index
    return nil unless @heap[index]
    if @heap[index] > new_value
      @heap[index] = new_value
      heapify_down index
    end
  end

  ##
  # Vaihtaa kahden elementin paikan
  # @param [Fixnum] ekan indeksi
  # @param [Fixnum] tokan indeksi. Näiden indeksien sisältämät Objektit vaihdetaan päittäin
  def swap(first_index, second_index)
    @heap[first_index], @heap[second_index] = @heap[second_index], @heap[first_index]
  end

  # Korjataan kekoehto/tarkastetaan sen olemassaolo
  # @param [Fixnum] index indeksi josta alaspäin kekoehto korjataan
  def heapify_up index
    if index != 0 #on parent olemassa TODO
      parent_i = parent_index index
      if @heap[parent_i] < @heap[index]
        swap(index, parent_i)
        heapify_up(parent_i)
      end
    end
  end

  ##
  # Tarkistaa ja tarvittaessa korjaa kekoehdon paremetrina saadusa indeksillä olevassa arvossa.
  # Kutsuttaessa tarkastetaan onko elementillä lapsia,
  # joiden arvo on suurempi kuin niiden parentin arvo
  #
  # @param [Fixnum] index, indeksi josta lähdetään liikkeelle
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
  ##
  # Katsotaan onko indeksissä olevalla itseään suurempia lapsia
  # Hyödynnetään kekoehdon ylläpidossa
  # @param [Fixnum] index, indeksi
  def has_bigger_childen? index
    childs = Hash.new
    for i in child_index index
      childs[i] = @heap[i]
    end
    nil if childs == [] or childs.values == nil or (child_index(index)).max == @heap.length
    @heap[childs.values.max]
    @heap[index] < childs.values.max
  end
  ##
  # Palauttaa suurimman lapsen indeksin
  # @param [Fixnum] index, indeksi
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
  
  def get_heap
    @heap
  end

end
