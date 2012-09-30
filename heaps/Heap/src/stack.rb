#Oma pino implementaatio
class Stack

  #Pinolla on stack taulukko
  attr_accessor :stack
  
  #Alustetaan pino
  def initialize
    @stack = Array.new
  end

  #Lisätään elementti pinon
  def push(item)
    @stack.push item
  end

  #Poimitaan elementti pinosta
  def pop
    @stack.pop
  end

  #Palautta pinon pituden
  def count
    @stack.length
  end

  #Tyhjentää pinon
  def clear
    @stack.clear
  end
  
  #Kertoo onko pino tyhjä
  def empty?
    @stack.empty?
  end
end