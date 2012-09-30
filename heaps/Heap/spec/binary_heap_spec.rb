require 'spec_helper'

describe BinaryHeap do
  
  before :each do
    @binary_heap = BinaryHeap.new
  end
  
  describe "#new" do
    it "return a new BinaryHeap object" do
      @binary_heap.should be_an_instance_of BinaryHeap
    end
  end

  describe "Using BinaryHeap" do
    it "should sort elements as required by heap property " do
      @binary_heap.heapify [1,2,3,4,5]
      @binary_heap.get_heap.should.eql? [5, 4, 3, 2, 1]
      @binary_heap.get_heap.should_not.eql? [1, 2, 3, 4, 5]
    end

    it "remove max should return highest value" do
      my_array = [2,33,45,-78,6,44,0,1,1]
      @binary_heap.heapify my_array
      heap = @binary_heap.get_heap
      removed = @binary_heap.remove_max
      removed.should.eql? heap.max
      removed.should.eql? heap[0]
    end

    it "should remove from index 0" do
      my_array = [2,33,45,-78,6,44,0,1,1]
      @binary_heap.heapify my_array
      heap = @binary_heap.get_heap
      removed = @binary_heap.remove_max
      removed.should.eql? heap.max
      removed.should.eql? heap[0]
    end

  end

  describe "#inc_key" do
    it "should increase value of key and move it to proper place" do
      my_array = [2,33,45,-78,6,44,0,1,-3]
      @binary_heap.heapify my_array
      heap = @binary_heap.get_heap.dup
      change_value_index = 8
      @binary_heap.inc_key 100, change_value_index
      heap2 = @binary_heap.get_heap
      heap2[0].should.eql? 100
      heap2.max.should.eql? 100
      heap2.should_not include heap[change_value_index]
    end

  end
  describe "#dec_key" do
    it "should decrease value of key and move it to proper place" do
      my_array = [2,33,45,-78,6,44,0,1,-3]
      @binary_heap.heapify my_array
      heap = @binary_heap.get_heap.dup
      change_value_index = 2
      @binary_heap.dec_key -345, change_value_index
      heap2 = @binary_heap.get_heap
      heap2.should_not include 33
      heap2[0].should.eql? 100
      heap2.max.should.eql? 100
      heap2.should_not include heap[change_value_index]
    end

  end
  
  describe "using BinaryHeap" do
    it "should work for small sets" do
      100.times do
        @binary_heap.heapify Random.rand(100)
      end
      results = []
      100.times do
        results.push @binary_heap.remove_max
      end
      sorted_array = results.dup.sort
      sorted_array.should.eql? results
    end
    
    it "should work for bigger sets" do
      10000.times do
        @binary_heap.heapify Random.rand(10000)
      end
      results = []
      10000.times do
        results.push @binary_heap.remove_max
      end
      sorted_array = results.dup.sort
      sorted_array.should.eql? results
    end
  end

end
