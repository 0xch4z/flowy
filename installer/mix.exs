for path <- :code.get_path(),
    Regex.match?(~r/flowy_new-[\w\.\-]+\/ebin$/, List.to_string(path)) do
  Code.delete_path(path)
end

defmodule Flowy.New.MixProject do
  use Mix.Project

  @version "0.1.0"
  @phoenix_version "1.7.10"
  @scm_url "https://github.com/flowy-framework/flowy"

  # If the elixir requirement is updated, we need to update:
  #
  #   1. all mix.exs generated by the installer
  #   2. guides/introduction/installation.md
  #   3. guides/deployment/releases.md
  #   4. test/test_helper.exs at the root
  #   5. installer/lib/mix/tasks/flowy.new.ex
  #
  @elixir_requirement "~> 1.15"

  def project do
    [
      app: :flowy_new,
      start_permanent: Mix.env() == :prod,
      version: @version,
      phoenix_version: @phoenix_version,
      elixir: @elixir_requirement,
      deps: deps(),
      package: [
        maintainers: [
          "Emiliano Jankowski"
        ],
        licenses: ["MIT"],
        links: %{"GitHub" => @scm_url},
        files: ~w(lib templates mix.exs README.md)
      ],
      preferred_cli_env: [docs: :docs],
      source_url: @scm_url,
      docs: docs(),
      homepage_url: "https://hexdocs.pm/flowy",
      description: """
      Flowy framework project generator.

      Provides a `mix flowy.new` task to bootstrap a new Elixir application
      with Flowy dependencies.
      """
    ]
  end

  def application do
    [
      extra_applications: [:eex, :crypto]
    ]
  end

  def deps do
    [
      {:ex_doc, "~> 0.24", only: :docs}
    ]
  end

  defp docs do
    [
      source_url_pattern: "#{@scm_url}/blob/v#{@version}/installer/%{path}#L%{line}"
    ]
  end
end
