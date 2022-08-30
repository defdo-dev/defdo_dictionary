defmodule Dictionary.Runtime.Server do
  @moduledoc false
  use Agent

  alias Dictionary.Impl.WordList

  @opaque t :: pid()

  @opaque word :: WordList.word()
  @opaque slug :: WordList.slug()
  @opaque path :: String.t()

  @name __MODULE__
  def start_link(_) do
    Agent.start_link(&WordList.word_list/0, name: @name)
  end

  @spec random_word :: word
  def random_word do
    Agent.get(@name, &WordList.random_word/1)
  end

  @spec random_slug(size_or_range :: integer | struct) :: slug
  def random_slug(number_of_words) do
    Agent.get(@name, &WordList.random_slug(&1, number_of_words))
  end
end
