require_relative './d_heap.rb'

#Maksimi binäärikeko
#DRY perjaatteen mukaan ei toisteta mitään koodia
class BinaryHeap < DHeap

  #Alustetaan binäärikeko
  def initialize
    super(2)
  end
end