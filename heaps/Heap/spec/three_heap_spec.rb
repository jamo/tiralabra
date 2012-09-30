require 'spec_helper'


describe ThreeHeap do
  
  before :each do
    @three_heap = ThreeHeap.new
  end
  
  describe "#new" do
    it "return a new ThreeHeap object" do
      @three_heap.should be_an_instance_of ThreeHeap
    end
  end
  
  describe "using ThreeHeaprap" do
    it "should work for small sets" do
      100.times do
        @three_heap.heapify Random.rand(100)
      end
      results = []
      100.times do
        results.push @three_heap.remove_max
      end
      sorted_array = results.dup.sort
      sorted_array.should.eql? results
    end
    
    it "should work for bigger sets" do
      10000.times do
        @three_heap.heapify Random.rand(10000)
      end
      results = []
      10000.times do
        results.push @three_heap.remove_max
      end
      sorted_array = results.dup.sort
      sorted_array.should.eql? results
    end
  end
  
end
