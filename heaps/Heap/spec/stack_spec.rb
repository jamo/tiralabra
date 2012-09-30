require 'spec_helper'

describe Stack do

  before :each do
    @stack = Stack.new 
  end

  describe "#new" do
    it "return a new Stack object" do
      @stack.should be_an_instance_of Stack
    end
  end
  
  describe "Using Stack" do
    it "should return latest element first" do
      ary = [5,3,7,2,1]
      ary.each do |a|
        @stack.push a
      end
      ary.reverse!
      ary.each do |a|
        @stack.pop.should.eql? a
      end
    end
    
    it "#Clear should clear Stack" do
      ary = [5,3,7,2,1,4,5,77,8,5,44,1337]
      ary.each do |a|
        @stack.push a
      end 
      @stack.should_not be_empty
      @stack.clear!
      @stack.should be_empty
    end
    
  end
  
end