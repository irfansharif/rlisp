module SchemeKeywords
  extend self

  def append
    lambda { |*args| args.inject(&:+) }
  end

  def eq?
    lambda { |*args| args.inject(&:==) }
  end

  def equal?
    lambda { |*args| args.inject(&:==) }
  end

  def list
    lambda { |*args| args }
  end

  def list?
    lambda { |arg| arg.instance_of? Array }
  end

  def max
    lambda { |*args| args.max }
  end

  def min
    lambda { |*args| args.min }
  end

  def not
    lambda { |*args| args.inject(&:!=) }
  end

  def null?
    lambda { |arg| arg == [] }
  end

  def number?
    lambda { |arg| arg.instance_of?(Fixnum) || arg.instance_of?(Float) }
  end
end
