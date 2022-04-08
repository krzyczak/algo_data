require "pry"

module MergeSort
  class << self
    def merge(arr1, arr2)
      merged = []

      i = 0
      j = 0
      while i < arr1.length || j < arr2.length
        if arr1[i] && arr2[j]
          if arr1[i] < arr2[j]
            merged.push(arr1[i])
            i += 1
          else
            merged.push(arr2[j])
            j += 1
          end
        elsif arr1[i] && !arr2[j]
          merged << arr1[i]
          i += 1
        elsif !arr1[i] && arr2[j]
          merged << arr2[j]
          j += 1
        else
        end
      end

      merged
    end

    def sort(arr)
      if arr.length < 2
        return arr
      end

      mid = arr.length / 2
      left_part = arr.slice(0, mid)
      right_part = arr.slice(mid, arr.length - mid)

      puts "Splitting into:"
      puts " left: #{left_part.inspect}"
      puts "right: #{right_part.inspect}"

      left = sort(left_part)
      right = sort(right_part)
      merged = merge(left, right)

      puts "Merging:"
      puts "  left: #{left.inspect}"
      puts " right: #{right.inspect}"
      puts "merged: #{merged.inspect}"

      return merged
    end
  end
end


puts MergeSort.sort([2,1]).inspect

puts "\n------------------------------------------------\n"

puts (z = (1..45).to_a.shuffle).inspect
puts MergeSort.sort(z).inspect
puts MergeSort.sort(z) == z.sort

puts "\n------------------------------------------------\n"

puts (z = (1..8).to_a.shuffle).inspect
puts MergeSort.sort(z).inspect
puts MergeSort.sort(z) == z.sort
