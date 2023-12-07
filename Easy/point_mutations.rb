=begin
Problem:
Input: A string of capitalized letters
Output: Integer of the Hamming distance

Calculate the number of differences at the same point in the DNA and return that
as an integer

Examples:
Straightforward.  If we have a smaller strand and larger strand, we only measure
based on the smaller and ignore the subsequent bases

Database and Algorithms
1. Create a class called `DNA`
2. In the initialize method we want to pass in the DNA strand as a string and
call this argumetn and the instance variable 'strand'
3. Create a method called 'hamming_distance' that accepts the `distance` argument
as the comparator strand and assign it to an instance variable of the same name
4. Find which strand is smaller and assign it to the variable 'smaller_strand',
which can be local and assign the larger strand to `larger_strand`
4.5. Initialize a local variable called hamm_distance
5. Iterate through each index value from 0 to smaller_strand.size - 1 and compare
the `smaller_strand` to the `larger_strand`.
6. If the index values are not equal we += 1 to a variable called `hamm_distance`
7. Return the `hamm_distance` variable

'GGACGGATTCTGACCTGGACTAATTTTGGGG'
'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    strands = [strand, distance].sort_by {|string| string.size }
    hamm_distance = 0
    strands[0].size.times do |idx|
      hamm_distance += 1 if strands[0][idx] != strands[1][idx]
    end
    hamm_distance
  end
end

# dna = DNA.new('GGACGGATTCTGACCTGGACTAATTTTGGGG')
# p dna.hamming_distance('AGGACGGATTCTGACCTGGACTAATTTTGGGG')


