module Rot
  AZ_DOWNCASE = ('a'..'z').to_a
  AZ_UPCASE = ('A'..'Z').to_a
  # NUMS = (0..9).to_a.yield_self { |nums| nums.map(&:to_s).zip(nums).to_h }
  NUMS = (0..9).to_a.map(&:to_s)

  def self.call(input, factor)
    input.split("").map do |char|
      char_downcase_index = AZ_DOWNCASE.index(char)
      char_upcase_index = AZ_UPCASE.index(char)
      num_index = NUMS.index(char)

      if char_downcase_index
        AZ_DOWNCASE[(char_downcase_index + factor) % AZ_DOWNCASE.length]
      elsif char_upcase_index
        AZ_UPCASE[(char_upcase_index + factor) % AZ_UPCASE.length]
      elsif num_index
        NUMS[(num_index + factor) % NUMS.length]
      else
        char
      end
    end.join
  end
end

input = "Zebra-493?"
puts Rot.call(input, 3)
res = Rot.call("#{input}", 3) == "Cheud-726?"
puts "Test: #{res}"
