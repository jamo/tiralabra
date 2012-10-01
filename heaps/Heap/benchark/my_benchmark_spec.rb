require 'benchmark'
require 'rspec'
require_relative '../src/binary_heap.rb'
require_relative '../src/d_heap.rb'
require_relative '../src/three_heap.rb'
require_relative '../src/stack.rb'



describe 'Benchmark' do
  
  before :each do
    @d = DHeap.new 10
    @b = BinaryHeap.new
    @t = ThreeHeap.new
  end
  

  describe 'binaryheap benchmark' do
=begin
    it 'shows performance' do
      n=100
      Benchmark.bmbm do |b|
        b.report("Binaarikeko #{n}:lla") do
          n.times {@b.insert Random.rand(1000)}
          n.times {@b.pop}
        end
        b.report("Kolmikeko #{n}:lla") do
          n.times {@t.insert Random.rand(1000)}
          n.times {@t.pop}
        end
        b.report("D-keko #{@d.d} #{n}:lla") do
          n.times {@d.insert Random.rand(1000)}
          n.times {@d.pop}
        end
        
    
        n1=30000
        
        b.report("Binaarikeko #{n1}:lla") do
          n1.times {@b.insert Random.rand(1000)}
          n1.times  {@b.pop}
        end
        b.report("Kolmikeko #{n1}:lla") do
          n1.times {@t.insert Random.rand(1000)}
          n1.times {@t.pop}
        end
        b.report("D-keko #{@d.d} #{n1}:lla") do
          n1.times {@d.insert Random.rand(1000)}
          n1.times {@d.pop}
        end
      end
    end
  end
=end  
  
  it 'tekee jotain kivaa' do
    Benchmark.bmbm do |b|
       (2..100).step(2) do |i|
        @d1 = DHeap.new i
        n2 = 10000
      
        b.report("D-keko #{@d1.d} #{n2}:lla") do
          n2.times {@d1.insert Random.rand(1000)}
          n2.times {@d1.pop}
        end
      end
    end
  end
  
end
end

