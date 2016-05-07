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
    tokens = tokenize(program)
    ast = parse(tokens)
    evaluate(ast)
  end

  def scheme_str(expression)
    return expression unless expression.is_a? Array
    "(#{expression.map { |val| scheme_str(val) }.join (' ') })"
  end

  def repl
    prompt = 'rlisp: '
    while true do
      print(prompt)
      val = compile gets.chomp
      puts scheme_str(val) unless val.nil? or val.to_s.empty?
    end
  end
end
