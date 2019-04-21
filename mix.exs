defmodule MogrifyParallel.MixProject do
  use Mix.Project

  def project do
    [
      app: :mogrify_parallel,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mogrify, "~> 0.7.2"}
    ]
  end

  def escript do
    [main_module: MogrifyParallel.CLI]
  end
end
