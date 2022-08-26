defmodule Dictionary.MixProject do
  @moduledoc false
  use Mix.Project

  @version File.read!("VERSION")
  @source_url "https://github.com/defdo-dev/defdo_dictionary"

  def project do
    [
      app: :defdo_dictionary,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      preferred_cli_env: [
        docs: :docs
      ]
    ]
  end

  defp package do
    [
      files: ~w(lib CHANGELOG.md LICENSE.md mix.exs README.md VERSION .formatter.exs),
      description: "It provides an API to work with words.",
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: [:dev, :docs]}]
  end

  defp docs do
    [
      main: "Dictionary",
      logo: "logo.png",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: [
        "CHANGELOG.md",
        "LICENSE.md"
      ]
    ]
  end
end
