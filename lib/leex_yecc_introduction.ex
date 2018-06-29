defmodule LeexYeccIntroduction do
  def parse(input) do
    with {:ok, tokens, _} <- :lexer.string(input)
         {:ok, result}    <- :parser.parse(tokens)
    do
      result
    else
      {:error, reason, _} ->
        reason
      {:error, {_, :parser, reason}} ->
        to_string(reason)
    end
  end
end
