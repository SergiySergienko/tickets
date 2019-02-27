#
# Reference ID generator
#
class RefIdService
  #
  # Generates entity ID
  # in the format similar to ABC-123-ABC-123-ABC
  #
  # @return [<String>] ID
  #
  def self.generate_id
    result = ""
    append_rand_sting = -> str { str << ('A'..'Z').to_a[rand(0..25)] }
    append_rand_digit = -> str { str << (1..9).to_a[rand(0..8)].to_s }
    4.times do |i| 
      method = ((i % 2 == 0) ? append_rand_sting : append_rand_digit)
      4.times { method.call(result) }
      result += "-" unless i == 3
    end
    result
  end

end
