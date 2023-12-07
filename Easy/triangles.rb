=begin
Problem:
Input: 3 integers for the different sides of the triangle
Output: String that indicates 'equilateral', 'isoceles', or 'scalene'

Examples: See test cases

Database and Algorithm
1. Create a Triangle class that can accept three values for the sides of the
triangle upon instantiation
1.5.  The side instance variables will be @s1, @s2, @s3
2. If one of the sides is less than or equal to zero, raise an ArgumentError
3. If the sum of the lenghts of any two sides is less than a third side, raise
an ArgumentError
4. If @s1, @s2, @s3 are all equal, return 'equilateral'
5. If two of the sides are equal to on another, and one is not return 'isosceles'
6. If 4 and 5 are not true, return 'scalene'
=end

class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError if sides.max >= (sides.sum - sides.max)
  end

  def kind
    if sides.max == sides.min
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end
end