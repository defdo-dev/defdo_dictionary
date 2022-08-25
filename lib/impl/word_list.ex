defmodule Dictionary.Impl.WordList do
  @moduledoc """
  Retrieve the word list by default it used de popular words from.
  """
  @type t :: list(String.t())
  @type word :: String.t()
  @type file :: file :: String.t()
  @type slug :: String.t()

  @doc """
  Returns a list of words, if you provide a file with the new dictionary
  It will load to the memory instead, by default it uses a popular dictionary.
  """
  @spec word_list(file) :: t
  @spec word_list() :: t
  def word_list(file \\ popular_path()) do
    file
    |> File.read!()
    |> String.split("\n", trim: true)
  end

  @doc """
  Get a random word using the words provided.
  """
  @spec random_word(t) :: word
  def random_word(words), do: Enum.random(words)

  @doc """
  Get a random slug using the words provided.
  """
  @spec random_slug(t, number_of_words :: integer | struct) :: slug
  def random_slug(words, size) when is_integer(size) and size > 0 do
    random_slug(words, 1..size)
  end

  def random_slug(words,  %Range{} = range) do
    range
    |> Enum.map(fn _ -> random_word(words) end)
    |> Enum.join("-")
  end

  defp popular_path do
    Application.app_dir(:dictionary, "/priv/popular.txt")
  end
end
