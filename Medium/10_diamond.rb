=begin
Problem:
Input: A capitalize letter(string)
Output: A group of string variables

Requirements
1. All rows will have two identical letters except the first and last.
2. A diamond shape will be created from alphabetical order where the middle
letter inidcates

Examples:
See test file

Database and Algorithms
1. Create a Diamond class
2. Create a `self.make_diamond` class method that can accept a capitalize letter
(string) argument.  'letter' will be the name of this argument.
3. Iterate starting from character 'A' to 'letter' using a range and converting
that range into an array.
4. From 3 we use the `each` method to iterate through

=end

class Diamond
  def self.make_diamond(final_letter)
    center_width = ('A'..final_letter).to_a.size * 2 - 1
    top_diamond = ''
    middle_string = ''
    logic_proc = Proc.new do |letter|
      if letter == 'A'
        middle_string = 'A'
      else
        middle_string = letter + ' ' * middle_string.size + letter
      end
      top_diamond << middle_string.center(center_width) + "\n"
    end

    ('A'..final_letter).each(&logic_proc)

    bottom_diamond = ''
    top_diamond.each_line do |line|
      next if line.include?(final_letter)
      bottom_diamond.prepend(line)
    end
    top_diamond + bottom_diamond
  end
end