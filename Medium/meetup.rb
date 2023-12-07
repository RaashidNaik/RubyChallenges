=begin
Problem:
Input:
1. A year and month as integer values to create a Meetup object
2. A day of the week string (e.g. 'Monday') and a descriptor (e.g. 'first')

Output:
A date.civl object

Requirements
1. The program will provide a year, month, day of the week and a descriptor
of when that day of the week will correspond to.
2. The program must output the exact date where that occurs.
3. For the teenth we find the first occurrence of the weekday where the day of
the month is

Examples and Test Cases

High Level Algorithm:
Date.new(year, month) can create a date object
wday will determine the day of the week
Can use Date.valid_date? to determine if the date will work or not. So we can
iterate from 1..31 for each calendar date.  If we don't find a valid date,
within that month, we have to return `nil`

We need to create a `weekday_count` variable that can keep track of the
weeday number in the current month

Database and Algorithm
1. Create a Meetup class that can accept a `year` and `month` arguments in the
initialize method as intance variables
2. Create a `day` method that will accept a `weekday` and `descriptor` arguments
and convert both of them to lowercase
2.5. If the descriptor is the `teenth` use the `teenth` method
2.6 If the descriptor is the `last` use the `last` method
3. normal_descriptor method
  a. Iterate from (1..31) and assign `day` parameter to each of these values
  b. Determine if the date is valid`Date.valid_date?(year, month, day)
  c. If b is `true` determine the day of the week using Date.civil(year, month, day).wday
  d. If the value in c is == to `weekday` value then add `weekday_count += 1`
  e. if `weekday_count` == to the DESCRIPTORS[weekday.to_sym] then we return
  the date we have in line c.
  f. If we can't find a valid date, then we return `nil`
4. `teenth` method
  a. Iterate from (1..31) and assign `day` parameter to each of these values
  b. Determine if the date is valid`Date.valid_date?(year, month, day)
  c. If b is `true` determine the day of the week using Date.civil(year, month, day).wday
  d. If the value in c is == to `weekday' and `day` value is > 12 but less than 20
  then return the value in c.
  e. Else return `nil`
5. `last` method
  a. Iterate from 31 downto 1 and assign the `day` parameter to each of these
  values
  b. Determine if the date is valid`Date.valid_date?(year, month, day)
  c.  If b is `true` determine the day of the week using Date.civil(year, month, day).wday
  d. If the value in c is == to `weekday` then return the value in c.

=end

#WEEKDAY  = %w(Monday Tuesday Wednesday Thursday Friday Saturday)

require 'date'

class Meetup
  attr_reader :year, :month

  DESCRIPTORS = { first: 1, second: 2, third: 3, fourth: 4, fifth: 5 }
  WEEKDAY  = {sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4,
              friday: 5, saturday: 6}

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    weekday = weekday.downcase
    descriptor = descriptor.downcase
    if descriptor == 'teenth'
      teenth(weekday)
    elsif descriptor == 'last'
      last(weekday)
    else
      normal_descriptor(weekday, descriptor)
    end
  end

  def normal_descriptor(weekday, descriptor)
    weekday_count = 0
    1.upto(31) do |day|
      if Date.valid_date?(year, month, day) &&
        Date.civil(year, month, day).wday == WEEKDAY[weekday.to_sym]
        weekday_count += 1
      end
      if weekday_count == DESCRIPTORS[descriptor.to_sym]
        return Date.civil(year, month, day)
      end
    end
    nil
  end

  def teenth(weekday)
    13.upto(19) do |day|
      if Date.valid_date?(year, month, day) &&
        Date.civil(year, month, day).wday == WEEKDAY[weekday.to_sym]
        return Date.civil(year, month, day)
      end
    end
    nil
  end

  def last(weekday)
    31.downto(1) do |day|
      if Date.valid_date?(year, month, day) &&
        Date.civil(year, month, day).wday == WEEKDAY[weekday.to_sym]
        return Date.civil(year, month, day)
      end
    end
  end

end

# meetup1 = Meetup.new(2016, 3)

# p meetup1

# p meetup1.day('Monday', 'last')