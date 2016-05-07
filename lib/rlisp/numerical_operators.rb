module NumericalOperators
  extend self

  def add
    lambda { |*args| args.inject(&:+) }
  end

  def subtract
    lambda { |*args| args.inject(&:-) }
  end

  def multiply
    lambda { |*args| args.inject(&:*) }
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

  alias_method :*, :multiply
  alias_method :+, :add
  alias_method :-, :subtract
  alias_method :/, :divide
  alias_method :>, :greater_than
  alias_method :<, :less_than
  alias_method :>=, :greater_than_or_equal
  alias_method :<=, :less_than_or_equal
  alias_method :==, :equals
  alias_method :!=, :not_equals
end
