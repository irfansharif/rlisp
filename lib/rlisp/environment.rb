module Environment
  extend self

  def math_library_functions
    Math.singleton_methods.map do |method|
     [method, Math.method(method)]
    end.to_h
  end

  def numerical_operators
    (Fixnum.instance_methods - Object.instance_methods).map do |method|
      [method, [Fixnum.instance_method(method), Float.instance_method(method)]]
    end.to_h
  end

  def scheme_operators
    {
      
    } 
  end

  def standard_environment
    env = {}

    env.update(math_library_functions)
    env.update(numerical_operators)
  end
end
