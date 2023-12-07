=begin
Problem
Input: Integer less than or equal to 3000
Output: String of Roman Numerals

The only characters you will need in the strings are I, V, X, L, C, D, M

Units Digit

1, 2, 3 = I, II, III

4, 5, 6, 7, 8 = IV, V, VI, VII, VIII

9, 10 = IX, X

Tens Digit

10, 20, 30 = X, XX, XXX

40, 50, 60, 70, 80 =  XL, L, LX, LXX, LXXX

90, 100 = XC, C

Hundreds Digit

100, 200, 300 = C, CC, CCC

400, 500, 600, 700, 800 = CD, D, DC, DCC, DCCC

900, 1000 = CM, M


Thousands Digit

1000, 2000, 3000 = M, MM, MMM

Can create anchor numbers  1 is I, 5 is V, 10 is X,

Examples:

Viewing test cases that only go up to 3000. We will only have four digits to
contend with.

Database and Algorithms
1. Establish a constant variable `ROMAN_NUMERALS` that will match the decimal
number in string with the corresponding roman numeral using a hash.  The key
will be the decimal value and the value will be the roman numeral string.
2. Create a `RomanNumeral` class
3. Upon instatiation of the `RomanNumeral` class we initialize a variable called
`decimal_number` and pass in the integer argument. We should convert this into a
string so that we can manipulate it on a character by character basis.
3.4. We create a method called `to_roman`
3.5. We initialize a variable called `roman_number` as an empty string.
4. We break up the `decimal_number` string into separate characters in an array
5. We iterate through each character and index value and assign `char` and
`idx` as the values.
6. We will add decimal_number.size - idx zeroes onto the `char` value and call the
corresponding roman numeral value from `ROMAN_NUMERALS`.
7. We will take the value in 6 and add it to `roman_number`
8. Return `roman_number`
=end

# class RomanNumeral
#   ROMAN_NUMERALS = {
#     '1' => 'I',
#     '2' => 'II',
#     '3' => 'III',
#     '4' => 'IV',
#     '5' => 'V',
#     '6' => 'VI',
#     '7' => 'VII',
#     '8' => 'VIII',
#     '9' => 'IX',
#     '10' => 'X',
#     '20' => 'XX',
#     '30' => 'XXX',
#     '40' => 'XL',
#     '50' => 'L',
#     '60' => 'LX',
#     '70'=> 'LXX',
#     '80' => 'LXXX',
#     '90' => 'XC',
#     '100' => 'C',
#     '200' => 'CC',
#     '300' => 'CCC',
#     '400' => 'CD',
#     '500' => 'D',
#     '600' => 'DC',
#     '700' => 'DCC',
#     '800' => 'DCCC',
#     '900' => 'CM',
#     '1000' => 'M',
#     '2000' => 'MM',
#     '3000' => 'MMM'
#   }

#   attr_reader :decimal_number

#   def initialize(decimal_number)
#     @decimal_number = decimal_number.to_s
#   end

#   def to_roman
#     roman_number = ''
#     decimal_number.chars.each_with_index do |char, idx|
#       next if char == '0'
#       digit_with_zeroes = char + ('0' * (decimal_number.size - idx - 1))
#       roman_number << ROMAN_NUMERALS[digit_with_zeroes]
#     end
#     roman_number
#   end

# end

require 'pry'

class RomanNumeral
  attr_reader :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      binding.pry
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

roman = RomanNumeral.new(359)
p roman.to_roman

