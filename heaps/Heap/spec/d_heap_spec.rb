require 'spec_helper'

describe DHeap do

  before :each do
    @heap = DHeap.new 3
  end

  describe "#new" do
    it "return a new DHeap object" do
      @heap.should be_an_instance_of DHeap
    end
  end

  describe "Using D-ary-Heap" do
    it "sort element by heap property" do
      @heap.heapify 1, 5, 5, 4, 3, 3
      @heap.heap.should.eql? [5, 3, 5, 4, 1, 3]
      while max = @heap.remove_max

        pp max
      end
      pp @heap.heap

    end

  end

=begin
  describe "Using BinaryHeap" do
    it "should sort elements as required by heap property " do
      @heap.heapify [1,2,3,4,5]
      @heap.get_heap.should.eql? [5, 4, 3, 2, 1]
      @heap.get_heap.should_not.eql? [1, 2, 3, 4, 5]
    end

    it "remove max should return highest value" do
      my_array = [2,33,45,-78,6,44,0,1,1]
      @heap.heapify my_array
      heap = @heap.get_heap
      removed = @heap.remove_max
      removed.should.eql? heap.max
      removed.should.eql? heap[0]
    end

    it "should remove from index 0" do
      my_array = [2,33,45,-78,6,44,0,1,1]
      @heap.heapify my_array
      heap = @heap.get_heap
      removed = @heap.remove_max
      removed.should.eql? heap.max
      removed.should.eql? heap[0]
    end

  end


  describe "#inc_key" do
    it "should increase value of key and move it to proper place" do
      my_array = [2,33,45,-78,6,44,0,1,-3]
      @heap.heapify my_array
      heap = @heap.get_heap.dup
      change_value_index = 8
      @heap.inc_key 100, change_value_index
      heap2 = @heap.get_heap
      heap2[0].should.eql? 100
      heap2.max.should.eql? 100
      heap2.should_not include heap[change_value_index]
    end

  end
  describe "#dec_key" do
    it "should decrease value of key and move it to proper place" do
      my_array = [2,33,45,-78,6,44,0,1,-3]
      @heap.heapify my_array
      heap = @heap.get_heap.dup
      change_value_index = 2
      @heap.dec_key -345, change_value_index
      heap2 = @heap.get_heap
      heap2.should_not include 33
      heap2[0].should.eql? 100
      heap2.max.should.eql? 100
      heap2.should_not include heap[change_value_index]
    end

  end
=end

end
