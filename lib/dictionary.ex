defmodule Dictionary do
  @moduledoc """
  The Dictionary module provides a way to interact with words files.

  Currently we use a popular.txt file as default, but you can bring your own file.

  At this stage you can use it to create your slugs based on the provided words.
  """
  alias Dictionary.Impl.WordList

  @opaque t :: WordList.t()
  @opaque word :: WordList.word()
  @opaque slug :: WordList.slug()
  @opaque path :: String.t()

  @doc """
  Start a list of words, if you provide a file with the new dictionary
  It will load to the memory instead, by default it uses a popular dictionary.
  """
  @spec start() :: t
  defdelegate start(), to: WordList, as: :word_list

  @spec start(WordList.file()) :: t
  defdelegate start(file), to: WordList, as: :word_list

  @doc """
  Get a random word using the words provided.
  """
  @spec random_word(t) :: word
  defdelegate random_word(words), to: WordList

  @doc """
  Get a random slug using the words provided.
  """
  @spec random_slug(t, size_or_range :: integer | struct) :: slug
  defdelegate random_slug(words, range), to: WordList

  @doc """
  Give the application dictionary path to get the popular.txt file.
  """
  @spec popular_dictionary_path() :: path
  defdelegate popular_dictionary_path, to: WordList
end
