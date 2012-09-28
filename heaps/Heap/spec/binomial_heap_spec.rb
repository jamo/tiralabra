require 'spec_helper'
require 'pry'
describe BinomialHeap do

  before :each do
    @heap = BinomialHeap.new
  end

  describe "#new" do
    it "return a new BinomialHeap object" do
      @heap.should be_an_instance_of BinomialHeap
    end
  end
  
  describe "Using BinomialHeap" do
    it "adding should work" do
      100.times do
        @heap.insert Random.rand(0..100)
      end
      #pp @heap
      
      100.times do
      #  binding.pry
        if @heap.extract_min == nil
          #binding.pry
        end
      end
#      binding.pry
      pp @heap
    end
  end
end
