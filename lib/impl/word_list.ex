defmodule Dictionary.Impl.WordList do
  @moduledoc """
  Retrieve the word list by default it used de popular words from.
  """
  @type t :: list(String.t())
  @type word :: String.t()
  @type file :: file :: String.t()

  @doc """
  Returns a list of words, if you provide a file with the new dictionary
  It will load to the memory instead, by default it uses a popular dictionary.
  """
  @spec word_list(file) :: t
  @spec word_list() :: t
  def word_list(file \\ "priv/popular.txt") do
    file
    |> File.read!()
    |> String.split("\n", trim: true)
  end

  @doc """
  Get a random word using the words provided.
  """
  @spec random_word(t) :: word
  def random_word(words), do: Enum.random(words)
end
