class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(array)
    matches = []
    array.each do |other|
      next if word.downcase == other.downcase
      matches << other if word.downcase.chars.sort == other.downcase.chars.sort
    end
    matches
  end
end