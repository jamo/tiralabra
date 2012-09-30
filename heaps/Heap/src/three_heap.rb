require_relative './d_heap.rb'
#DRY perjaatteen mukaisesti ei toisteta ylimääräistä koodia
#Vaan kirjoitetaan kukin asia vain kertaalleen.
class ThreeHeap < DHeap 
  
  #Alustaa kolmikeon
  def initialize 
    super(3)
  end
  
end