require_relative "./src/fibo.rb"

require "benchmark"
require "pry"


# puts Benchmark.measure("call") { Fibo.call(40) }.inspect
puts Benchmark.measure("memo") { Fibo.memo(8500) }.inspect
puts Benchmark.measure("iter") { Fibo.iter(8500) }.inspect

puts Fibo.memo(20) == Fibo.call(20)
puts Fibo.call(20) == Fibo.iter(20)

# binding.pry
