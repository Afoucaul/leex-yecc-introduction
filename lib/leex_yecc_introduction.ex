defmodule LeexYeccIntroduction do
  # def parse(input) do
  #   with {:ok, tokens, _} <- :lexer.string(input)
  #        {:ok, result}    <- :parser.parse(tokens)
  #   do
  #     result
  #   else
  #     {:error, reason, _} ->
  #       reason
  #     {:error, {_, :parser, reason}} ->
  #       to_string(reason)
  #   end
  # end

  def display_tree(roots, prefix \\ "")

  def display_tree([], prefix), do: nil

  def display_tree({name, attributes, children}, _prefix) do
    IO.puts("#{name} #{inspect attributes}")
    display_tree(children, "")
  end

  def display_tree([{name, attributes, children}], prefix) do
    IO.puts("#{prefix}└── #{name} #{inspect attributes}")
    display_tree(children, prefix <> "    ")
  end

  def display_tree([{name, attributes, children} | nodes], prefix) do
    IO.puts("#{prefix}├── #{name} #{inspect attributes}")
    display_tree(children, prefix <> "│   ")
    display_tree(nodes, prefix)
  end
end
