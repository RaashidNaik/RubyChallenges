=begin
Problem
Input: String (with only decimal digits) (octal)
Output: Integer (base 10)

Explicit Requirements: The program will take an octal number and convert it
into a base 10 number.

Examples and Test Cases
Provided by the exercise

Databases and Algorithms
1. Create an `Octal` class
2. Creat an initialize instance method with the octal string as the parameter.
Call it `oct`.
2.4. Create a `to_decimal` method with the below code in it.
2.5 If `oct` is not an decimal digit then convert it to '0'
3. Determine the size of `oct` and assign that to `digits`
3.5. Initialize a `base10` variable and set it to 0
4. Iterate through each character and index in `oct` but first convert it to an
array of characters.  The parameter will be `char` and `idx`
  a. Multiply `char`(convert it into an integer) by 8 ^ (digits - 1 - idx)
  b. Add the value in a to the `base10` variable
5. Return the `base10` variable

=end


class Octal
  attr_reader :oct

  def initialize(oct)
    @oct = oct
  end

  def to_decimal
    return 0 unless valid_octal?
    digits = oct.length
    base10 = 0
    oct.chars.each_with_index do |char, idx|
      base10 += char.to_i * 8**(digits - 1 - idx)
    end
    base10
  end

  private

  def valid_octal?
    oct.chars.all? { |n| n =~ /[0-7]/ }
  end
end