class CustomSet
  attr_reader :set

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(datum)
    set.include?(datum)
  end

  def subset?(other)
    set.all? { |datum| other.set.include?(datum) }
  end

  def disjoint?(other)
    set.none? { |datum| other.set.include?(datum) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(datum)
    set << datum
    self
  end

  def ==(other)
    eql?(other)
  end

  def intersection(other)
    intersection_set = []
    set.each { |datum| intersection_set << datum if other.set.include?(datum) }
    CustomSet.new(intersection_set)
  end

  def difference(other)
    difference_set = []
    set.each { |datum| difference_set << datum if !other.set.include?(datum) }
    CustomSet.new(difference_set)
  end

  def union(other)
    CustomSet.new(set + other.set)
  end
end