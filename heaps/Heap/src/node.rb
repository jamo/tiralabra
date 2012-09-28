class Node
  attr_accessor :key, :degree, :sibling, :parent, :child

  def initialize key
    @key = key
    @degree = 0
  end

end