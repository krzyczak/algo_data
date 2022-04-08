# Naive approach O(N^2)
def are_they_eq(arr_a, arr_b)
  return true if arr_a == arr_b
  return false if arr_a.length != arr_b.length

  (2..(arr_b.length - 1)).to_a.reverse.each do |sub_length|
    (0..(arr_b.length - sub_length)).each do |i|
      pre = arr_b.slice(0, i)
      mid = arr_b.slice(i, sub_length)
      aft = arr_b.slice(sub_length + i, arr_b.length - (sub_length + i))

      sub_reversed = (pre + mid.reverse + aft)

      if sub_reversed == arr_a
        return true
      end
    end
  end

  return false
end

a0 = [1,2,3,4]
b0 = [1,4,3,2]

a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
b1 = [1, 2, 3, 5, 4, 6, 7, 8, 9, 10]

a2 = (0..1000).to_a
b2 = (0..1000).to_a
b2[546] = 547
b2[547] = 546

puts(are_they_eq(a0, b0) == true)
puts(are_they_eq(a1, b1) == true)
puts(are_they_eq(a2, b2) == true)
