class ASTNode
  attr_accessor :type, :value

  def initialize(value)
    self.value = value
    self.type = value.class
  end
end

module AST
  extend self

  def generate_abstract_syntax_tree(tokens)
    raise if tokens.length == 0 or tokens.first == ')'
    if tokens.first == '('
      tokens.shift
      abstract_syntax_tree = []
      while tokens.first != ')' do
        sub_tree = generate_abstract_syntax_tree(tokens)
        abstract_syntax_tree << sub_tree
      end

      tokens.shift
      return abstract_syntax_tree
    else
      return ASTNode.new tokens.shift
    end
  end
end
