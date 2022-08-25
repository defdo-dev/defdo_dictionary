defmodule DictionaryTest do
  use ExUnit.Case
  doctest Dictionary

  test "generate a slug" do
    # We are checking the format of the string, not the randomness
    assert Dictionary.random_slug(["hello"], 3) == "hello-hello-hello"
  end

  test "check we receive the path for popular dictionary" do
    Dictionary.popular_dictionary_path() =~ "lib/dictionary/priv/popular.txt"
  end
end
