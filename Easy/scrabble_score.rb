class Scrabble
  attr_reader :word
  SCORE_ARRAY = [['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'], 1],
                [['D', 'G'], 2], [['B', 'C', 'M', 'P'], 3],
                [['F', 'H', 'V', 'W', 'Y'], 4], [['K'], 5], [['J', 'X'], 8],
                [['Q', 'Z'], 10]

  def initialize(word)
    @word = word
  end

  def score
    total_score = 0
    return 0 if word == nil
    word.upcase.chars.each do |char|
      SCORE_ARRAY.each do |char_array|
        total_score += char_array[1] if char_array[0].include?(char)
      end
    end
    total_score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
