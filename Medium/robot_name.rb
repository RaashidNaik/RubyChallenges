=begin
Problem
Input: None. Just create a new Robot object
Output: A String

Requirements:
1. When generating a Robot object, the program will create a Robot name
on instantiation.
2. The name generated consists of two random alphabetical capitalized characters
following by 3 random decimal numbers.
3. If a new name is generated, it must not conflict with another one (class
variable)
4. There must be a reset method to assign a new name.


Examples Test Cases
See test files

Database and Algorithms
1. Create a `Robot` class
2. Initialize a class variable calle `@@robot_names` and assign it to a blank
array.
3. Create the initialize method
  c. Initialize a @name variable and assign it to an instance method called
  `name_generator`.
  d. The return value of `name_generator` shall be a random Robot name
  c. In `name_generator` create a local variable in the method called `robot_name`
  and assign it to an empty string
  d. Create a loop
  e. Create a variable called random_generator = Random.new
  f. For 2.times create a random alphabetical uppercase character and append it
  to the `robot_name` variable using random_generator.rand(65..90).chr
  g. For 3 times create a random decimal digit character and append it to the
  `robot_name` variable using random_generator.rand(48..57).chr.
  h. break out of the loop in step d if `robot_name` is not included in the
  `@@robot_names` array
  i. Add `robot_name` to `@@robot_names`
  j. Return `robot_name` in the method so that the `@name` instance variable
  is assigned to this name.
4. Create a `reset` instance method as well that will re-assign the `@name`
instance variable to a new name but having it equal to the `name_generator`
method.
=end

class Robot
  attr_accessor :name

  def initialize
    @name = name_generator
  end

  def reset
    @@robot_names.delete(name)
    self.name = name_generator
  end

  private

  @@robot_names = []

  def name_generator
    robot_name =''
    loop do
      2.times { robot_name << rand(65..90).chr }
      3.times { robot_name << rand(48..57).chr }
      break unless @@robot_names.include?(robot_name)
    end
    @@robot_names << robot_name
    robot_name
  end
end