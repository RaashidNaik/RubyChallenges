=begin
Problem
Input: Set of integers (1 or more) - optional
       Integer - required

Output: Integer

Explicit Requirements
1. A natural number will be provided and then optionally a set of integers may
or may not also be provided (splat)
2. If no set is provided, assume the set is going to be 3, 5
3.  Find the multiples of the set that are less than the natural number
4. Add the number all together


Examples:
See test cases

Database and Algorithms
1. Create a SumOfMultiples class
2. Create a `self.to` class method with a integer parameter that will
represent the natural number.  We will label this `nat_num`
3. Create an `initialize` intance method that accepts a list of numbers that
can be 1 or more.  We will call this `*multiples`, which will be represented
as an array `@multiples = multiples`
4. In the `self.to` class method we need to return the sum of the multiples:
  a. If @multiples == nil, @multiples = [3, 5]
  b. Iterate through @multiples for each variable and call the parameter `num`
    i. Initialize a variable called `multiple` and have it equal `num`
    ii. Initialize a second variable called `times` and have it equal 1
    ii. loop
      a.

=end

class SumOfMultiples

  def initialize(*multiples)
    @set_of_nums = multiples
  end

  def to(nat_num)
    self.class.to(nat_num, @set_of_nums)
  end

  def self.to(nat_num, set_of_nums = [3, 5])
    list_of_multiples = []
    set_of_nums.each do |num|
      multiple = num
      factor = 1
      loop do
        break if multiple >= nat_num
        list_of_multiples << multiple
        factor += 1
        multiple = num * factor
      end
    end
    list_of_multiples.uniq.sum
  end
end

# p SumOfMultiples.to(10)
