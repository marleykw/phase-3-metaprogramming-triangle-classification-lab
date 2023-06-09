require 'pry'
class Triangle

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    sides = [a,b,c]
    ineq = [a+b > c, a+c > b, b+c > a]

    if sides.min <= 0 || ineq.include?(false)
      raise TriangleError
    end

    if equilateral?
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif scalene?
      :scalene
    elsif isosceles?
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end #kind

  def equilateral?
    a == b && b == c
  end
  def isosceles?
    (a == b && b != c) || (b == c && c != a) || (a == c && c != b)
  end
  def scalene?
    a != b && a != c && b != c
  def validate_triangle
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end
end

  

binding.pry