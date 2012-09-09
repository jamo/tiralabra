require 'pp'

class MyNode
  #attr_accessor :data, :parent, :key, :child, :sibling, :degree

  def initialize data, key
    pp "created new node: data:#{data} key:#{key} from MyNode.rb"
    #@data, @key = data = key
  end

=begin
  def print_node
    result = String.new
    if parent
      result << parent.key.to_s + "\t"
    else
      result << "---\t"
    end
    result << key
    result << "\t"
    result << degree+"\t"
    if sibling
      result << sibling.key+"\t"
    else
      result << "--- \t"
    end

    if child
      result << child.key + "\t"
    else
      result << "--- \t"
    end
  end
=end
end