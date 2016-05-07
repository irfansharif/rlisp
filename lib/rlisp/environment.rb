require_relative 'numerical_operators'
require_relative 'scheme_keywords'

module Environment
  extend self

  def math_library_functions
    Math.singleton_methods.map do |method|
     [method, Math.method(method)]
    end.to_h
  end

  def numerical_operators
    NumericalOperators.singleton_methods.map do |method|
      [method, NumericalOperators.send(method)]
    end.to_h
  end

  def scheme_keywords
    SchemeKeywords.singleton_methods.map do |method|
      [method, SchemeKeywords.send(method)]
    end.to_h
  end

  def standard_environment
    @environment ||= begin
      env = {}

      env.update(math_library_functions)
      env.update(numerical_operators)
      env.update(scheme_keywords)
    end
  end
end
