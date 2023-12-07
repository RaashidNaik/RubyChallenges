class BeerSong

  def self.lyrics
    self.verses(99, 0)
  end

  def self.verse(first)
    self.verses(first)
  end

  def self.verses(first, second = first)
    return_string = ''
    first.downto(second) do |bottles|
      if bottles == 0
        return_string << "No more bottles of beer on the wall, no more " \
        "bottles of beer.\nGo to the store and buy some more, 99 bottles " \
        "of beer on the wall.\n"
      else
        return_string << "#{bottle_name(bottles)} of beer on the wall, " \
        "#{bottle_name(bottles)} of beer.\nTake " \
        "#{ bottles == 1 ? 'it': 'one' } down and pass it around, " \
        "#{bottle_name(bottles - 1)} of beer on the wall.\n"
      end
      break if bottles == second
      return_string << "\n"
    end
    return_string
  end

  def self.bottle_name(bottles)
    if bottles == 1
      '1 bottle'
    elsif bottles == 0
      'no more bottles'
    else
      "#{bottles} bottles"
    end
  end
end