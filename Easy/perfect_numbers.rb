class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    divisors = []
    (number - 1).downto(1) do |num|
      divisors << num if number % num == 0
    end
    aliquot = divisors.sum
    if aliquot == number
      'perfect'
    elsif aliquot > number
      'abundant'
    else
      'deficient'
    end
  end
end

