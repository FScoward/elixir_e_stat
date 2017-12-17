defmodule ElixirEStat do
  @moduledoc """
  Documentation for ElixirEStat.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirEStat.hello
      :world

  """
  def hello do
    conf = Mix.Config.read!("config/config.exs")
    conf[:elixir_e_stat][:app_id]
      |> mk_url 
      |> HTTPoison.get
      |> parse
  end

  # def parse(%{:ok, content}), do: Poison.decode content
  # def parse(error), do: IO.puts "END"

  def parse(_content) do
    with {:ok, content} <- _content
    do
      parsed = Poison.decode!(content.body, 
        as: %EStatResponse{GET_STATS_DATA: %GetStatsData{PARAMETER: %Parameter{NARROWING_COND: %NarrowingCond{}}}})
    else
      {:error, e} -> IO.puts "ERROR" <> e
    end
  end

  # http://api.e-stat.go.jp/rest/2.0/app/getStatsData?appId=<アプリケーションID>&statsDataId=C0020050213000&cdCat01=%23A03503

  def mk_url app_id do
    "http://api.e-stat.go.jp/rest/2.0/app/json/getStatsData?appId=#{app_id}&statsDataId=C0020050213000&cdCat01=%23A03503"
  end
end
