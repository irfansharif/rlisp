require "rlisp/version"
require "rlisp/ast"
require "rlisp/environment"
require "rlisp/eval"
require "rlisp/tokenizer"

module RLisp
  extend self

  def tokenize(program)
    Tokenizer.tokenize(program)
  end

  def parse(tokens)
    AST.generate_abstract_syntax_tree(tokens)
  end

  def evaluate(ast)
    Eval.evaluate(ast)
  end

  def compile(program)
    evaluate(parse(tokenize(program)))
  end
end
