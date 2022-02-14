defmodule Dictionary do
  @popular_words "priv/popular.txt"
    |> File.read!()
    |> String.split("\n", trim: true)

  def random_popular_word do
    Enum.random(@popular_words)
  end
end
