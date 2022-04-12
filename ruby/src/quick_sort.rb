module QuickSort
  class << self
    def simple(list)
      return list if list.length < 2

      pivot = list[list.length / 2]

      left = []
      mid = []
      right = []

      list.each do |current|
        if current < pivot
          left << current
        end

        if current > pivot
          right << current
        end

        if current == pivot
          mid << current
        end
      end

      simple(left) + mid + simple(right)
    end

    def more_ruby(list)
      return list if list.length < 2

      pivot = list.delete_at(list.length / 2)
      left, right = list.partition(&pivot.method(:>))
      more_ruby(left) + [pivot] + more_ruby(right)
    end
  end
end
