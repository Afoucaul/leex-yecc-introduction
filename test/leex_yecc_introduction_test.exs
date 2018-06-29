defmodule LeexYeccIntroductionTest do
  use ExUnit.Case
  import LeexYeccIntroductionTest

  test "simple orphan tag" do
    input = "<a/>"
    assert parse(input) == {"a", %{}, []}
  end

  test "simple tag pair" do
    input = "<a></a>"
    assert parse(input) == {"a", %{}, []}
  end

  test "orphan tag with attributes" do
    input = ~S(<a foo="12" bar="27" />)
    assert parse(input) == {"a", %{foo: 12, bar: 27}, []}
  end

  test "two-level tree structure" do
    input = ~S(<a><b /></a>)
    assert parse(input) == {"a", %{}, [{"b", %{}, []}]}
  end
end
