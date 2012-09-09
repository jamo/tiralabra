class Node
  attr_accessor :key, :sibling, :parent, :child, :degree

  def initialize key
    @key = key
    @degree = 0
  end

end