module Tokenizer
  extend self

  def tokenize(program)
    tokens = program
      .gsub('(', ' ( ')
      .gsub(')', ' ) ').strip.split(/ /)
    tokens.delete ""
    tokens.delete "\n"

    tokens
  end
end
