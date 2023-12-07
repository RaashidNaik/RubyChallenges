class Element
  attr_accessor :datum, :next_element

  def initialize(datum, next_element = nil)
    @datum = datum
    @next_element = next_element
  end

  def tail?
    datum
  end

  def next
    next_element
  end

end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    size == 0
  end

  def push(data)
    list.prepend(Element.new(data, list[0]))
  end

  def peek
    list[0].datum if !empty?
  end

  def head
    list[0]
  end

  def pop
    list.shift.datum
  end

  def self.from_a(array)
    new_list = new
    if array
      array.reverse_each do |datum|
        new_list.push(datum)
      end
    end
    new_list
  end

  def to_a
    list.map { |element| element.datum }
  end

  def reverse
    reverse_list = self.class.new
    list.each do |element|
      reverse_list.push(element.datum)
    end
    reverse_list
  end

end

# list = SimpleLinkedList.from_a([1, 2])
# p list
# list_r = list.reverse
# p list_r