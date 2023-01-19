# rulerslib/rulers/array.rb

class Array
  def deeply_empty?
    empty? || all?(&:empty?)
  end
end