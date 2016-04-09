module NumericalOperators
  extend self

  def add
    lambda { |*args| args.inject(&:+) }
  end

  def subtract
    lambda { |*args| args.inject(&:-) }
  end

  def multiply
    lambda { |*args| args.inject(&:-) }
  end

  def divide
    lambda { |*args| args.inject(&:/) }
  end

  def greater_than
    lambda { |*args| args.inject(&:>) }
  end

  def less_than
    lambda { |*args| args.inject(&:<) }
  end

  def greater_than_or_equal
    lambda { |*args| args.inject(&:>=) }
  end

  def less_than_or_equal
    lambda { |*args| args.inject(&:<=) }
  end

  def equals
    lambda { |*args| args.inject(&:==) }
  end

  def not_equals
    lambda { |*args| args.inject(&:!=) }
  end
end
