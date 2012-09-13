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
    end
  end

  describe "#remove_max" do
    it "return biggest element from heap" do
      @heap.heapify 1, 5, 5, 4, 3, 3
      results = []
      while @heap.not_empty?
        results << @heap.remove_max
      end
      results.should.eql?(results.sort)
    end
  end

  describe "#inc_key" do
    it "increase value of key" do
      @heap.heapify 1, 5, 6, 4, 3, 3, 10, 15, 30, -22, 0
      before = @heap.heap.dup
      @heap.inc_key 100, 4 #kasvatetaan arvoa 1
      after = @heap.heap.dup
      after.should_not include 1
      after.should include 100
      before.should_not include 100
    end

    it "increase value of key - another test" do
      @heap.heapify 1, 5, 6, 4, 3, 3, 10, 15, 30, -22, 0, 1, 2, 3, 14, 14, 5
      before = @heap.heap.dup
      @heap.inc_key 7, 3 #kasvatetaan arvoa 4
      after = @heap.heap.dup
      after.should_not include 4
      after.should include 7
      before.should_not include 7

    end

    it "should not fail if index > heap.length" do
      @heap.heapify 1, 5, 6
      before = @heap.heap.dup
      value = @heap.inc_key 7, 4
      after = @heap.heap.dup
      @heap.heap.should.eql? [6, 1, 5]
    end
  end

  describe "#dec_key" do
    it "decrease value of key" do
      @heap.heapify 1, 5, 6, 4, 3, 3, 10, 15, 30, -22, 0
      before = @heap.heap.dup
      @heap.dec_key -200, 4 #pienennetään arvoa 1
      after = @heap.heap.dup
      after.should_not include 1
      after.should include -200
      before.should_not include -200
    end

    it "decrease value of key - another test" do
      @heap.heapify 1, 5, 6, 4, 3, 3, 10, 15, 30, -22, 0, 1, 2, 3, 14, 14, 5
      before = @heap.heap.dup
      @heap.dec_key -8, 3 #kasvatetaan arvoa 4
      after = @heap.heap.dup
      after.should_not include 4
      after.should include -8
      before.should_not include -8

    end

    it "should not fail if index > heap.length" do
      @heap.heapify 1, 5, 6
      before = @heap.heap.dup
      value = @heap.dec_key -10, 4
      after = @heap.heap.dup
      @heap.heap.should.eql? [6, 1, 5]
    end
  end

  describe "#clear!" do
    it "should clear heap-array" do
      @heap.heapify 1, 5, 6, 4, 3, 3, 10
      @heap.clear!
      @heap.empty?.should.eql? true
    end
  end

  describe "#inject_heap" do
    it "should subtitude heap-array with given array" do    #TODO!
      @heap.heapify 1, 5, 6, 4, 3, 3, 10
      old_heap = @heap.heap.dup
      @heap.inject_heap [1,1,1]
      @heap.heap.should_not.eql? old_heap
    end
  end

  describe "#peak" do
    it "shows first element in heap-array" do
      @heap.heapify 1, 5, 6, 4, 3, 3, 10
      @heap.peak.should.eql? @heap.heap[0]
    end
  end

end
