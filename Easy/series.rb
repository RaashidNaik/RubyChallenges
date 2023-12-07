class Series
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def slices(slice)
    raise ArgumentError if slice > number.size
    return_arr = []
    number.chars.map(&:to_i).each_cons(slice) { |nums| return_arr.push(nums) }
    return_arr
  end

end

# new_series = Series.new('91274')

# p new_series.slices(4)