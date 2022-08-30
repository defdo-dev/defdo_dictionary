defmodule Dictionary do
  @moduledoc """
  The Dictionary module provides a way to interact with words files.

  Currently we use a popular.txt file as default, but you can bring your own file.

  At this stage you can use it to create your slugs based on the provided words.
  """
  alias Dictionary.Runtime.Server

  @opaque word :: WordList.word()
  @opaque slug :: WordList.slug()
  @opaque path :: String.t()

  @doc """
  Start a list of words, if you provide a file with the new dictionary
  It will load to the memory instead, by default it uses a popular dictionary.
  """

  @doc """
  Get a random word using the words provided.
  """
  @spec random_word :: word
  defdelegate random_word, to: Server

  @doc """
  Get a random slug using the words provided.
  """
  @spec random_slug(size_or_range :: integer | struct) :: slug
  defdelegate random_slug(range \\ 2), to: Server
end
