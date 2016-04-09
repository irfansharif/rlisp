require_relative 'environment'

module Eval
  extend self

  def evaluate(expression, environment = Environment.standard_environment)
    return environment[expression] if expression.is_a? Symbol and environment[expression]
    return expression unless expression.is_a? Array

    if expression.first == :quote
      _, expression = expression
      return expression
    elsif expression.first == :if
      _, test, consequence, alternative = expression
      expression =  evaluate(test, environment) ? consequence : alternative
      return evaluate(expression, environment)
    elsif expression.first == :define
      _, key, value = expression
      key = evaluate(key, environment)
      environment[key.to_sym] = evaluate(value, environment)
    else
      procedure = evaluate(expression.first, environment)
      *parameters = expression[1..-1].map do |exp|
        evaluate(exp, environment)
      end
      return procedure.call(*parameters)
    end
  end
end
