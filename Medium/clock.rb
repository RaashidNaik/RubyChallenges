=begin
Problem
Requirements
1. Create a `Clock` class that can establish the hours and minutes by creating
a new clock object using the `at` class method and passing in the `hours` and
`minutes` as arguments
2. Should be able to add and subtract minutes from a `Clock` object, but
this action should create a new `clock` object with the appropriate time in
hours and minutes based on those calculations.
3. If two separate `Clock` objects have the same time, they should be considered
equal (create a `==` method for intances)
4. Create a `to_s` method to have a digital readout of the time. (e.g. '23:01')
5. Times should be in a 24 hour format. 0 should be treated as 24 hours.

Examples and Test Cases
See test cases

Databases and Algorithms
1. Creat a `Clock` class
2. Create a `self.at` class method that creates a new `Clock` object with the
hours and minutes arguments passed into it
  a. The `minutes` argument is optional and should default to 0
  b. If hours is 0, use 24 hours instead
3. Create an `+` method

=end


class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def +(total_mins)
    op_hours, op_mins = convert_mins(total_mins)
    new_mins = minutes + op_mins
    new_hours = hours + op_hours
    new_hours, new_mins = time_format(new_hours, new_mins)
    self.class.at(new_hours, new_mins)
  end

  def -(total_mins)
    op_hours, op_mins = convert_mins(total_mins)
    new_mins = minutes - op_mins
    new_hours = hours - op_hours
    new_hours, new_mins = time_format(new_hours, new_mins)
    self.class.at(new_hours, new_mins)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  private

  def convert_mins(total_mins)
    total_mins.divmod(60)
  end

  def time_format(new_hours, new_mins)
    if new_mins >= 60
      new_mins -= 60
      new_hours += 1
    elsif new_mins < 0
      new_mins += 60
      new_hours -= 1
    end

    if new_hours < 0
      new_hours += 24 until new_hours > 0
    elsif new_hours >= 24
      new_hours -= 24 until new_hours < 24
    end

    [new_hours, new_mins]
  end
end